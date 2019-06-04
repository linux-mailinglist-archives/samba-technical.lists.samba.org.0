Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A79034CAA
	for <lists+samba-technical@lfdr.de>; Tue,  4 Jun 2019 17:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+2mCy9GWWaqu7IFi6axiAOR7thmNn3+Ud/B8DxI0XMw=; b=T3M9FVg0Litak24dgf8xwhWOXf
	o1vmfNacfYNUkvUihgCy9uRMRX+juPEJsPuS8eUYqnGyqJOIXgxSMnSFCGYLt/KjcBxRAJ0IwvuYq
	ERxyMTWVFvmRSwjCqDdCTyGnT88wF6IsjfENMf9rrXT8ewtknV1f5Fe/4BQdl8wcA3EhDdCoxVqUR
	UcvKVJVvqeyaHake//yu63hEjRCBrH5q1fGQLSuDdqbrELORvcmOxLnOGvlSxVxr9x2CtYU4Panca
	bMQNt3dHUu8QczrEFR3YddJ6cmN2puVbzVwD4SyKPY8nnvWnRKpWzt8NbsmESURmNfYcsZfaFb4ct
	oFeaHD4A==;
Received: from localhost ([::1]:22232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hYBlB-00580I-5X; Tue, 04 Jun 2019 15:54:01 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:33052) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hYBl6-00580B-Ub
 for samba-technical@lists.samba.org; Tue, 04 Jun 2019 15:53:59 +0000
Received: by mail-lf1-x12e.google.com with SMTP id y17so16849106lfe.0
 for <samba-technical@lists.samba.org>; Tue, 04 Jun 2019 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=v4/GHm4qLe6V755ZwXrEb69ONsW0OoTX/PjN+UXrRsQ=;
 b=D6K42VGahwMmPWlavBR56ErOkssGKYfgp8XEXF6E5glRLptJVqMM0tFoYPsWbYdL9d
 DSMaXk2hDUWM6KQRuKVBRbenx7v0KuJnUajeyQQ1BdUuOxijgMUbB8HRtj8d3LaP+ais
 roQgHHZdAc72HPUWVVeHRMr0RQ7eCSSjPsajG3bhP1jaNIICTrtX9i5Di3DWgQrEJ4mD
 a7TSb4olj0fybms2FN7Gze7gy/oJGly83/UqK483/9qBnSt15oW1/30q5D7UTXcWu0v0
 nvA8oN9xXJAGhmrDj5iJKJZjR/z4fmRyFCyZKe8OdDZsYfrZc7MSvgpZNnV2BV5zSNS1
 qpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=v4/GHm4qLe6V755ZwXrEb69ONsW0OoTX/PjN+UXrRsQ=;
 b=DtmHTNmxuNUvJIaNSuFTMB9kB9aQko/XXGOBDRHvS8ixxIteDyi1mz8vY8hM09Fcg0
 8seeiLBx8u0ig2Pw31Y5kC0zZsnCxlnHGkp7xB3mc2qcgk2MfeEPxyIi3hUYOt4gFgtD
 NW0W5XwadIFYlbJKyDTCvFyfRv0XMYEZ3EHCQf8ZFLjh7ul26n8NMMLOD4LJSICVUNzO
 Nj8IQC/WbNI7quCap6WPdh35GJ5IjiVse1IZz50ET93cLyadCwuEnlPiBLeVeVLYx8rU
 HhvcSq4S4W90QCpuHAExPKT9KDco/dr0AscYnDG2lSwIE8CprkiE9ZQvbLOzbmDOoPMV
 d2iA==
X-Gm-Message-State: APjAAAXIAGotimAZCLaHfNUhQ3+/XbHep0sBBVlU4yHAh9ZaXcbQt5qO
 Lu9g5KAbsfvBXUl7p4t5re7NT7vPQfyAvr4usq9edUvM
X-Google-Smtp-Source: APXvYqypoqx9TMg02k7NPtOiYFkcdZbEe0WHfF7LeoBBS9f+xEdkEOZa5u4ISS8Z9zkhFRyBLaxsS/DwDAFeMUFXgNg=
X-Received: by 2002:a19:488e:: with SMTP id
 v136mr16363476lfa.192.1559663635636; 
 Tue, 04 Jun 2019 08:53:55 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 4 Jun 2019 21:23:44 +0530
Message-ID: <CAP=9937Fer2X453XWZL=MHp+huWLwuE89rhkK1Z-QDkoytegeg@mail.gmail.com>
Subject: Linking external library with samba
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Priya PM via samba-technical <samba-technical@lists.samba.org>
Reply-To: Priya PM <pmpriya@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Good Morning.
I need a help in compiling samba code with an external library options. I
have a library created independent of samba to check a pattern of write
request data and i am interested to utilize the same library and not
rewrite the same code in samba. Hence looking for an option to either link
this library statically or dynamically. Could anyone please let me know how
could this be achieved. This experiment is for my own study not for any
production environment.

Thanks
Priya
