# 家庭小药箱 - 实现计划

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** 搭建 Taro + React 小程序项目框架，实现成员管理、生病记录、药品管理、数据迁移核心功能

**Architecture:** 使用 Taro 4.x + React 构建微信/支付宝小程序，采用本地文件存储数据，预留 OCR 服务接口，实现 JSON 数据导出导入

**Tech Stack:** Taro 4.x, React, TypeScript, Tailwind CSS (或 CSS Modules), 阿里云免费 OCR

---

## Phase 1: 项目初始化

### Task 1: 初始化 Taro 项目

**Files:**
- Create: `package.json`
- Create: `taro.config.ts`
- Create: `project.config.json`

**Step 1: 创建项目配置**

```bash
# 检查 Node.js 版本
node -v  # 要求 >= 18

# 创建 Taro 项目（选择 React + TypeScript）
npm create taro@latest home-medicine-box -- --template react-ts
cd home-medicine-box

# 安装依赖
npm install
```

**Step 2: 配置项目**

```typescript
// taro.config.ts
import type { UserConfigExport } from '@tarojs/plugin-miniify'

const config: UserConfigExport = {
  projectName: 'home-medicine-box',
  date: '2026-02-28',
  designWidth: 750,
  deviceRatio: {
    750: 1 / 2,
    375: 2,
  },
  sourceRoot: 'src',
  outputRoot: 'dist',
  plugins: [],
  defineConstants: {},
  copy: {
    patterns: [],
    options: {},
  },
  framework: 'react',
  mini: {
    postcss: {
      pxtransform: {
        enable: true,
        config: {},
      },
      url: {
        enable: true,
        config: {
          limit: 1024,
        },
      },
      cssModules: {
        enable: false,
        config: {
          namingPattern: 'module',
          generateScopedName: '[name]__[local]___[hash:base64:5]',
        },
      },
    },
  },
  h5: {},
}

export default config
```

**Step 3: 验证项目构建**

```bash
# 微信小程序构建
npm run dev:weapp

# 确认 dist 目录生成成功
ls dist
```

---

### Task 2: 项目目录结构搭建

**Files:**
- Create: `src/types/index.ts`
- Create: `src/services/storage.ts`
- Create: `src/services/export.ts`
- Create: `src/services/ocr.ts`
- Create: `src/utils/index.ts`
- Create: `src/app.tsx`
- Create: `src/app.config.ts`

**Step 1: 创建类型定义**

```typescript
// src/types/index.ts

// 成员类型
export interface Member {
  id: string;
  name: string;
  birthday?: string;
  bloodType?: string;
  allergies: string[];
  avatar?: string;
  remark?: string;
  createdAt: number;
}

// 生病记录类型
export interface IllnessRecord {
  id: string;
  memberId: string;
  date: string;
  type: 'hospital' | 'self';
  diagnosis: string;
  symptoms: string;
  medicineIds: string[];
  photos: string[];
  doctorAdvice: string;
  createdAt: number;
}

// 药品类型
export interface Medicine {
  id: string;
  name: string;
  purpose?: string;
  usage?: string;
  purchaseDate?: string;
  expiryDate?: string;
  contraindications: string[];
  photos: string[];
  stock?: number;
  createdAt: number;
}

// 应用数据（用于导出/导入）
export interface AppData {
  version: string;
  members: Member[];
  illnesses: IllnessRecord[];
  medicines: Medicine[];
  exportedAt: number;
}
```

**Step 2: 创建存储服务**

```typescript
// src/services/storage.ts
import { Member, IllnessRecord, Medicine, AppData } from '../types';

const KEYS = {
  MEMBERS: 'members',
  ILLNESSES: 'illnesses',
  MEDICINES: 'medicines',
  VERSION: 'app_version',
};

function getData<T>(key: string, defaultValue: T): T {
  try {
    const data = localStorage.getItem(key);
    return data ? JSON.parse(data) : defaultValue;
  } catch {
    return defaultValue;
  }
}

function setData<T>(key: string, data: T): void {
  localStorage.setItem(key, JSON.stringify(data));
}

export function generateId(): string {
  return Date.now().toString(36) + Math.random().toString(36).substr(2);
}

export const memberStorage = {
  getAll: () => getData<Member[]>(KEYS.MEMBERS, []),
  save: (members: Member[]) => setData(KEYS.MEMBERS, members),
  add: (member: Member) => {
    const members = memberStorage.getAll();
    members.push(member);
    memberStorage.save(members);
  },
  update: (id: string, data: Partial<Member>) => {
    const members = memberStorage.getAll();
    const index = members.findIndex(m => m.id === id);
    if (index !== -1) {
      members[index] = { ...members[index], ...data };
      memberStorage.save(members);
    }
  },
  delete: (id: string) => {
    const members = memberStorage.getAll().filter(m => m.id !== id);
    memberStorage.save(members);
  },
};

export const illnessStorage = {
  getAll: () => getData<IllnessRecord[]>(KEYS.ILLNESSES, []),
  save: (illnesses: IllnessRecord[]) => setData(KEYS.ILLNESSES, illnesses),
  add: (record: IllnessRecord) => {
    const records = illnessStorage.getAll();
    records.push(record);
    illnessStorage.save(records);
  },
  update: (id: string, data: Partial<IllnessRecord>) => {
    const records = illnessStorage.getAll();
    const index = records.findIndex(r => r.id === id);
    if (index !== -1) {
      records[index] = { ...records[index], ...data };
      illnessStorage.save(records);
    }
  },
  delete: (id: string) => {
    const records = illnessStorage.getAll().filter(r => r.id !== id);
    illnessStorage.save(records);
  },
  getByMember: (memberId: string) => {
    return illnessStorage.getAll().filter(r => r.memberId === memberId);
  },
};

export const medicineStorage = {
  getAll: () => getData<Medicine[]>(KEYS.MEDICINES, []),
  save: (medicines: Medicine[]) => setData(KEYS.MEDICINES, medicines),
  add: (medicine: Medicine) => {
    const medicines = medicineStorage.getAll();
    medicines.push(medicine);
    medicineStorage.save(medicines);
  },
  update: (id: string, data: Partial<Medicine>) => {
    const medicines = medicineStorage.getAll();
    const index = medicines.findIndex(m => m.id === id);
    if (index !== -1) {
      medicines[index] = { ...medicines[index], ...data };
      medicineStorage.save(medicines);
    }
  },
  delete: (id: string) => {
    const medicines = medicineStorage.getAll().filter(m => m.id !== id);
    medicineStorage.save(medicines);
  },
  checkExpiry: (id: string): { expired: boolean; daysLeft: number } | null => {
    const medicine = medicineStorage.getAll().find(m => m.id === id);
    if (!medicine || !medicine.expiryDate) return null;

    const expiry = new Date(medicine.expiryDate);
    const now = new Date();
    const daysLeft = Math.floor((expiry.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));

    return {
      expired: daysLeft < 0,
      daysLeft,
    };
  },
};

export function exportAllData(): AppData {
  return {
    version: '1.0.0',
    members: memberStorage.getAll(),
    illnesses: illnessStorage.getAll(),
    medicines: medicineStorage.getAll(),
    exportedAt: Date.now(),
  };
}

export function importData(data: AppData): void {
  memberStorage.save(data.members || []);
  illnessStorage.save(data.illnesses || []);
  medicineStorage.save(data.medicines || []);
}
```

**Step 3: 创建工具函数**

```typescript
// src/utils/index.ts

export function formatDate(date: string | Date, format: string = 'YYYY-MM-DD'): string {
  const d = typeof date === 'string' ? new Date(date) : date;
  const year = d.getFullYear();
  const month = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return format.replace('YYYY', String(year)).replace('MM', month).replace('DD', day);
}

export function calculateAge(birthday: string): number {
  const birth = new Date(birthday);
  const now = new Date();
  let age = now.getFullYear() - birth.getFullYear();
  const monthDiff = now.getMonth() - birth.getMonth();
  if (monthDiff < 0 || (monthDiff === 0 && now.getDate() < birth.getDate())) {
    age--;
  }
  return age;
}

export function isExpired(expiryDate: string): boolean {
  return new Date(expiryDate) < new Date();
}

export function getDaysLeft(expiryDate: string): number {
  const expiry = new Date(expiryDate);
  const now = new Date();
  return Math.floor((expiry.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
}

export const BLOOD_TYPES = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

export function timestamp(): number {
  return Date.now();
}
```

**Step 4: 创建 OCR 服务接口（预留）**

```typescript
// src/services/ocr.ts

export interface MedicalReportResult {
  diagnosis: string;
  symptoms: string[];
  doctorAdvice: string;
}

export interface MedicineResult {
  name: string;
  purpose: string;
  usage: string;
  expiryDate: string;
  contraindications: string[];
}

export interface OCRService {
  recognizeMedicalReport(imagePath: string): Promise<MedicalReportResult>;
  recognizeMedicine(imagePath: string): Promise<MedicineResult>;
}

export class AliYunOCRService implements OCRService {
  private appCode: string;
  constructor(appCode: string) {
    this.appCode = appCode;
  }

  async recognizeMedicalReport(imagePath: string): Promise<MedicalReportResult> {
    console.log('OCR识别病例单:', imagePath);
    return { diagnosis: '', symptoms: [], doctorAdvice: '' };
  }

  async recognizeMedicine(imagePath: string): Promise<MedicineResult> {
    console.log('OCR识别药品:', imagePath);
    return { name: '', purpose: '', usage: '', expiryDate: '', contraindications: [] };
  }
}

let ocrService: OCRService | null = null;

export function initOCRService(service: 'aliyun' | 'baidu', config: any): void {
  switch (service) {
    case 'aliyun':
      ocrService = new AliYunOCRService(config.appCode);
      break;
  }
}

export function getOCRService(): OCRService | null {
  return ocrService;
}
```

---

## Phase 2: 页面与组件开发

### Task 3: 成员管理页面

**Files:**
- Create: `src/pages/members/index.tsx`
- Create: `src/pages/members/components/MemberCard.tsx`
- Create: `src/pages/members/components/MemberForm.tsx`

### Task 4: 生病记录页面

**Files:**
- Create: `src/pages/illness/index.tsx`
- Create: `src/pages/illness/components/IllnessForm.tsx`

### Task 5: 药品管理页面

**Files:**
- Create: `src/pages/medicine/index.tsx`
- Create: `src/pages/medicine/components/MedicineForm.tsx`

### Task 6: 设置与数据迁移页面

**Files:**
- Create: `src/pages/settings/index.tsx`

### Task 7: 底部导航与页面配置

**Files:**
- Create: `src/app.config.ts`

---

## Phase 3: 测试与构建

### Task 8: 测试与验证

```bash
# 开发模式
npm run dev:weapp

# 生产构建
npm run build:weapp
```

---

## 任务清单汇总

| 任务 | 描述 |
|------|------|
| Task 1 | 初始化 Taro 项目 |
| Task 2 | 项目目录结构搭建 |
| Task 3 | 成员管理页面 |
| Task 4 | 生病记录页面 |
| Task 5 | 药品管理页面 |
| Task 6 | 设置与数据迁移 |
| Task 7 | 底部导航配置 |
| Task 8 | 测试与构建 |

---

*文档版本: v1.0*
*创建日期: 2026-02-28*
