Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E902FD72A
	for <lists+samba-technical@lfdr.de>; Wed, 20 Jan 2021 18:39:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=N1nXgJki9MgcCRScY1iR1Z/5q+TIzYPnjNVff5v9KpM=; b=VWH9+0H+NauACI7L28687H15UI
	ObCf1QlQHSh6rs/od9DTmwOySvmCkgR+kGMI/QmHThWtMG4CtXpNUYylv6E1CWsQ+GvoNVYsrg5/n
	CL68ut4CPRbsxw9oy6s7p7LowIarbKcAIpDuLURf8xfitNPgEp/4RUgwL+lpiUDSiDehwh5tEMiyr
	CMQZPqVmBP5exbUgmks/EF7f2R7XUSf/L+YZGDaj+HslqC87hkSZEmtT4nBLE+M7nTseIWgQHf9KX
	2U57QYBEdS283+xH9WGQ59L/xImtr5JQfqB/VKbTUSkfjtCIerQ6dI/gsTFGsIF18Z4cOnk15usSe
	EGyTG+Tg==;
Received: from ip6-localhost ([::1]:64408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l2HRB-006N6v-80; Wed, 20 Jan 2021 17:38:33 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:40879) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2HR5-006N6n-2l
 for samba-technical@lists.samba.org; Wed, 20 Jan 2021 17:38:29 +0000
Received: by mail-yb1-xb33.google.com with SMTP id w24so17973410ybi.7
 for <samba-technical@lists.samba.org>; Wed, 20 Jan 2021 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+BpsNzZAUNjS2cTxY0d55zZguRuHvUf0vDlfX5yWBAc=;
 b=QqFdy+h3XH3VWUcbdLBVJc5qwcYnZfUzNnKkd9IAORuuzJrK9Tbx5pUyZdybY8iWek
 0AJOILIzn0aTgT3Q3SNQkbitfb5B3Mvask3Kp/uHiBqealY0FNFhlwYq3NgWeGci+Rg8
 VyyPXkrjxgjwKYqBgEbcVEAiMhx6Qjspn0iGKl7phpZM0XChbv9fTvlnKL5zFdWYplOE
 RsDVoL0gwI7s3v6VFPf+lgSLLkcH59AqgtLsonGz3HFbib8KP/9SjWvdqHNhIy3GIsaJ
 9JsWu7/+dKXrCBWRnLYNWngFOt68CcR/thHPCuk7E3V4pb90wwHL8ZZKb0tj/WlXMpv1
 gvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+BpsNzZAUNjS2cTxY0d55zZguRuHvUf0vDlfX5yWBAc=;
 b=kZEVsnFJh6HH8+vh8gVEl7r+wTZQHTeKKLbIKpU6+SUAnbWYuC2+gPjHsvppyBGxDb
 wipskeqj1neEZVbYjTnYpyAEeSxL3uwerpotK0H+VyNqZZlotFsO5CyL+8CBOmbnFYgT
 1xgXucNfMdNa4mP0rS9EaIM2c8BtqOBVMOcx2EBJdwD46w9q8GXV2CsuUq0cMFwu0kva
 4obqaJfZINUMkexz8DZlaeKulEFuCe5aR/qzQUJT1Q+vLN8e9mzm88bswByNckTOFwWz
 FGch4jfVi5poVIhsMJxBLB0rJPZOIQpj9VG46Ggbja0Q4kEPGK8KtEHa3b9q7PTIbrti
 9vng==
X-Gm-Message-State: AOAM531SZd8R8xVmRQRSFNuD1ZtjjtTxRS18QqnA0y5sqaU/U6lOd36B
 MwY5XG5gZWD9f+Yuf23ozhjVS8VmcGhEdQ9lCqp2TeRf86Fu4w==
X-Google-Smtp-Source: ABdhPJzE5HA+sF7ymiw3oq9bOD1TDkihEiwGJoHHNd8ckIDg6TgeR+kINgikKO3ZICjdGn37zTz1cG87vn+9s2aQLS4=
X-Received: by 2002:a25:cb0b:: with SMTP id b11mr14501040ybg.323.1611164301797; 
 Wed, 20 Jan 2021 09:38:21 -0800 (PST)
MIME-Version: 1.0
References: <CAGha7mH29snpcpmK14800yWynZVgJDEVTvQBTi31u5-9HBP3JA@mail.gmail.com>
In-Reply-To: <CAGha7mH29snpcpmK14800yWynZVgJDEVTvQBTi31u5-9HBP3JA@mail.gmail.com>
Date: Wed, 20 Jan 2021 14:37:45 -0300
Message-ID: <CAGha7mEdy-B29PMUzkxtiznNZJvwdo21fiwnh2kq7hf7tYKBAg@mail.gmail.com>
Subject: Fwd: Help Needed: Samba share slow to query not existing files
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
From: =?utf-8?q?J=C3=B4natas_Hudler_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?J=C3=B4natas_Hudler?= <jonatashudler@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone,

*(First mail in this mailing list, so take it easy if I'm infringing any
good manners here)*

In a samba share we have a directory with lots of files - binaries and
resources to run our ERP application (around 20K entries).

The application is taking too long to load. The found reason is that the
application tries to load several files in a trial/error fashion, looking
for extensions in a particular order (e.g: file.dll, file.lbr, file.gnt,
file.int). Many of these files are not required and doesn't even exist.

Every "not found" hit take ~0.2 seconds. And there are lots of these events.

The thing is that apparently samba is not caching this result. My guess is
that every new not existing file open request causes a full directory's
entries lookup.

If I run this code (in a Windows Command Prompt) in this samba share, it
takes considerable time, whereas in a native Windows share it is
instantaneous.

  for /L %i in (1,1,50) do @dir \\server\share\not_existing.txt >nul

Anything that can be done?
------------------------------

Current smb.conf content:

# Global parameters
[global]
    netbios name = ***omitted***
    realm = ***omitted***
    server role = active directory domain controller
    workgroup = ***omitted***
    idmap_ldb:use rfc2307  = yes
    dns forwarder = ***omitted***
    vfs objects = acl_xattr
    map acl inherit = yes
    store dos attributes = yes
    #
    aio read size = 1
    aio write size = 1
    aio write behind = true
    socket options = TCP_NODELAY SO_RCVBUF=65535 SO_SNDBUF=65535
    read raw = yes
    write raw = yes
    max xmit = 65535
    dead time = 0
    getwd cache = no
    max connections = 5000
    time server = yes

------------------------------

Environment Details:

   - CentOS Linux release 7.6.1810 (Core)
   - Samba version 4.8.3
   - Application Runtime: Microfocus NetExpress (Cobol) v3.1


PS: This question was originally posted in the Server Fault website and can
be reached thru this link: Samba: Slow to query not existing files - Server
Fault
<https://serverfault.com/questions/1050543/samba-slow-to-query-not-existing-files>

Thank you in advance for all the support!

Jonatas Hudler
