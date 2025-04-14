## ✅ `README.md`

```md
# 🧱 Flutter 클린 아키텍처 템플릿 - Todo 샘플 앱

이 프로젝트는 Flutter 애플리케이션을 **클린 아키텍처 기반으로 구조화**하고,  
**Supabase API 연동**, **Riverpod 상태관리**, **Injectable 의존성 주입**,  
**Freezed 모델**, **환경변수 분리 (.env)** 등을 적용한 샘플입니다.

---

## ✨ 주요 기능

- ✅ 클린 아키텍처 (domain / data / application / presentation 분리)
- ✅ Supabase 기반 REST API 연동 (todos 테이블)
- ✅ Riverpod 기반 상태 관리 (AsyncNotifier 사용)
- ✅ Freezed로 불변 모델 생성
- ✅ Injectable + get_it으로 의존성 주입
- ✅ `.env` 환경변수로 민감정보 분리
- ✅ 확장 가능한 feature 중심 폴더 구조

---

## 📁 폴더 구조 예시

```
lib/
├── app/                            # 앱 진입점 및 라우팅
├── core/                           # DI, 공통 설정
│   └── di/
├── features/
│   └── todo/                       # Todo 기능 전체
│       ├── application/
│       ├── data/
│       ├── domain/
│       └── presentation/
```

---

## 🛠 시작하기

### 1. 의존성 설치

```bash
flutter pub get
```

### 2. `.env` 파일 추가 (❗절대 깃허브에 커밋하지 마세요)

루트에 `.env` 파일을 생성하고 다음을 입력:

```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key-here
```

### 3. DI 코드 생성

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. 앱 실행

```bash
flutter run
```

---

## 🧪 사용된 기술 스택

- Flutter 3.x
- Riverpod
- get_it
- injectable
- freezed / json_serializable
- Supabase
- flutter_dotenv

---

## 🔐 보안 참고사항

- `.env` 파일을 사용하여 API 키와 URL을 분리 관리합니다.
- Supabase의 Row Level Security(RLS)는 실제 서비스 시 반드시 설정이 필요합니다.
  (샘플 앱에서는 생략 가능)

---

## 📸 화면 예시

> UI 스크린샷을 여기에 첨부하면 좋아요

---

## 📄 라이선스

MIT © 2025 channoori
```

---

