Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 58435986F1A
	for <lists+samba-technical@lfdr.de>; Thu, 26 Sep 2024 10:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1th0J6kGvepIW/2NsBvnz8Idq0+2tTDhMa0v4AfYUtg=; b=lTia5YQeTF1VkcVoCDvu0jc0bF
	xYa0emq12ig4WOarmv5wE73Ep/ge1JZ06+yhjwQGnkyzlxRjkDG8O7k2qOM6ukgjrrGwULHUoHiXn
	AGzz9yaygPtDEI3y7/xRHTIms7p4dOlMRi2xNPZ0/wRXDUF+uBkgqH1Z/N4AtYIR+6cmXFS8SU4gd
	aqmjJ4TjqOMcnG3/hgTmeEPnxWHqBxeXWNS8mS23MT6xqpAMYkuQ4RM4g0j6RGvrb5GfmX8rm9izB
	7Ca+6AignH0hMjjIUzTPO0hc8f69Lskjog0vX/Y2VLLluF7RQ0TaA2RjlVkAGpU+Euj/v8mga+ml7
	829kjXlA==;
Received: from ip6-localhost ([::1]:60780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1stk4D-000htJ-T4; Thu, 26 Sep 2024 08:41:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:56791) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1stk48-000htC-TG
 for samba-technical@lists.samba.org; Thu, 26 Sep 2024 08:41:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-374c1e5fe79so478368f8f.1
 for <samba-technical@lists.samba.org>; Thu, 26 Sep 2024 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egnyte.com; s=google; t=1727340095; x=1727944895; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=R208JydqJzQ9F/NMhXrY9TY+tchMZwXiIYzS+mj9g48=;
 b=kNZRAxmFMJfYkNy/Jy0/F2RMNzvy4DxdSEIB5h8h1vC/JoClwsAJzSyuBbS2HmRwIX
 I6BQFUAUG3Rz6vGgSHKorwOaopvKegYALNkVScs0G2Cw/t9SQ+WTejCmq0lBAvpewesk
 62h2+0/b7w1Wdj0NlXh0kT9f7zGg4P9emDMYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727340095; x=1727944895;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R208JydqJzQ9F/NMhXrY9TY+tchMZwXiIYzS+mj9g48=;
 b=X3LvGm37Cd1gJ7zBtBIwnSj2r4ZaRF7Il/hdJatFHCdTjBTCj04+9AshC3B428tybn
 DdgZ9+IJENtR6knJikGkbgkpYBTeDW1ApXqIiAleYq7YoxK8BprPcoA8kFJwmEZQ0aRN
 sFeYc7WbPpTXjfCgCBiFfztto5icbO7JpXkV0r9Ut4Vmj71RN7FFeK4UWqy+XbhMkxnZ
 4101dJ9vvBpX6FlxFftuWsRLF/kby6CUYjop3E7nzluioitFAyEc1EW2c1xFYPTJ3ArH
 RygC6YCg9vz93LkYTMoLDb7BmBqtIUnSRP1k6GDnIG3Aw/Kl5Cx37V7BsQjFedTYI5gI
 1n+w==
X-Gm-Message-State: AOJu0Yx6Kyq15tle/L74qyWQMdfXKdvSrwbU0L4dGAJLOZMABDcgtlHr
 y2XPdtEUYRfApFGd3kaeAoJQA3wN1bZfZx+WnYwAfw+9DbxgmFX+vn+dAp6gMXQAefDaz3ZcER4
 F9au927InmY39a5AgBqccY+FpzKXASJCtkDHtNWjs2JpsrQB/Do2Hlw==
X-Google-Smtp-Source: AGHT+IHvwoNw6vxexep07bNJHCVhhQWZzZXP4FxefUPdgpH5ktBuiL1uzHUBeVQ1LEwOYhRKwmKkv/G+VsWhl78YxUQ=
X-Received: by 2002:a5d:4807:0:b0:374:c61a:69b8 with SMTP id
 ffacd0b85a97d-37cc24678a0mr3493854f8f.15.1727340094933; Thu, 26 Sep 2024
 01:41:34 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 26 Sep 2024 14:11:23 +0530
Message-ID: <CAF2c6-EiavvBJmf6gKRp394E1s4AjANH29PqWeJbiNdbCas3YA@mail.gmail.com>
Subject: VFS fruit and streams_xattr fake_fd passed on to other modules in
 stack
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
From: Varun Mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: Varun Mittal <vmittal@egnyte.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

I am working with VFS fruit and streams_xattr modules stacked before the
module for my filesystem. Samba version 4.18 and my SMB clients are Mac

My smb.conf snippet:
        fruit:metadata = stream
        fruit:resource = stream
        vfs objects = fruit streams_xattr <my-module>
        kernel share modes = Yes

I observe that the fruit module generates a fake_fd for AFP attributes and
then tries to take a lock with this fd.
However the fruit module doesn't implement a filesystem_sharemode wrapper,
so this is passed on to the streams_xattr module. Since that module doesn't
know about this fake fd, it passes it on to the next module. My VFS module
is unaware of this fd as well so it asserts

A similar thing happens with close() call of the fake_fd generated by
streams_xattr module.
The following check fails and the close() for fake_fd is passed on to the
next module
        if (!fsp_is_alternate_stream(fsp))

Am I missing some configuration ?
