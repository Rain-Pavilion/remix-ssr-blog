#使用 Node.js 官方镜像，指定版本为 14.16.1
FROM node:14.16.1

# 设置工作目录
WORKDIR /usr/src/app

# 复制 package.json 和 package-lock.json（如果存在）
COPY package*.json ./

# 设置 npm 使用淘宝镜像源
RUN npm config set registry https://registry.npmmirror.com

# 安装依赖
RUN npm install

# 复制应用代码
COPY . .

# 暴露应用运行的端口
EXPOSE 3333

# 启动应用
CMD ["npm", "run", "dev"]