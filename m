Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10F49D107
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 18:41:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6jpTt9uiP7GquKX8kRL/ILbhQuNr8lgcOSulzp0wM20=; b=xDseBIWQ8hv3zZyA5HGfRWYlks
	iUbiNUtwK0KnxErwSA/4MiQFJEquI0bQdQBZDaYGI8xmx5lMEbVq3Id1bcmrC2hK5S3LYa/o525rZ
	JEMIufvlyPowbo4/Z8FwC7EGNAUAOV3+sifEJ9aK9DUQIArn1Sx/Penqa7YVja7/663UGMRFP/Whl
	QC0pDRSWrcgK8i+6+pyLayWFZd2bsH1XwR9FEIejiS191rOrz4I+8ZAnchvV/SMIS4ggq4JwUUAiq
	bmRhEpQ0zaSw5/3Md6NfAqPM8uApvz0nh/DjEnLIT6HHle/122dC21qfWnd7gop0AeEj5CvkXghpn
	AW12F36g==;
Received: from ip6-localhost ([::1]:65078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCmHW-00193t-52; Wed, 26 Jan 2022 17:40:31 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:35835) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCmHI-00193j-RS
 for samba-technical@lists.samba.org; Wed, 26 Jan 2022 17:40:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id x11so414064lfa.2
 for <samba-technical@lists.samba.org>; Wed, 26 Jan 2022 09:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=7TwHhDZh5d28FV3zizqtWnkv7u7jGMfb5o/0RskGm3Y=;
 b=GAW/ROBiWNvHJtLCHaNIt4BirkpR3UF1NMYF5k/URMiNjWo3H/hqTSrdePfgxLZzFO
 j/OAWHdvYc4Z68bSUWX4Wo8yoibTlYCy8uZOR3m3iBLeNb2Ru8z2JDnU26fiM5So75oN
 KxOfPe5r7V6XTE9zLP02X/0QwncKen+Kq0XQPJPu7D0Ad9D4xG6CwZXrXavrYiW3useJ
 rDrmkZIOIQZV4f4/c4F6zkAEk9DVa3eM1n/jL/Ap3KtBeEMMeO16VJycvCH+hN0g29Uc
 PH3nJvH7Ahot3q9G8fqAR4NikjEXkwPQgys7lOaKFC+m9VNgQGK6iSH0YM2TXPmWoCcS
 zL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7TwHhDZh5d28FV3zizqtWnkv7u7jGMfb5o/0RskGm3Y=;
 b=qbZ1CAR9m8M0L2cy5T0qHCiXgy6fdr++U3GHjhBIdOZPikFjI+dBgNUvyLT7KtfT67
 A6KQRX8MMjBgNTI3X4D5HyM6NawYJv6yQPzQtlqSr9ew9lDVVkGIer4L3aTJ9yaNBod2
 SVCDVt1Uiln6HPmQDJsKDlG3o9uuqlrY0HYLvVVg00QPWsA9OBpGnsO2C5GZmyoIQAMt
 SRqjz1M1pz4NsGLf06jCYi8HYyCDz07lr2bpmXUw/wFXnHdPG5k0HdAVZM5DVgWMyS1H
 q5M2YsvQGnOV+YBLvGhNRMrk4lQKoP0Vfegbj7d7WAHl8iy/CzeYws3RT1qgVJSQhuqf
 0HMg==
X-Gm-Message-State: AOAM532tR5/MIbvEjKgTELKl17VOUTqKbKTeF8nYm762AXkTWrAUCV2i
 Rb4OzYH32T9MaRSS68Nr3K4sO9IHOUzVmN+wQozPcrSkLFA=
X-Google-Smtp-Source: ABdhPJx2bmOHmbqmyuYRnVYNfyofyn5fzkSIM3781DM7Kr9h+uOIL3vdbIGBAzeqz4zz3CU+hWRCkYNfwwXGnRR3E9s=
X-Received: by 2002:a19:4945:: with SMTP id l5mr20537665lfj.595.1643218815299; 
 Wed, 26 Jan 2022 09:40:15 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 26 Jan 2022 11:40:04 -0600
Message-ID: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
Subject: Samba build error: module 'time' has no attribute 'clock'
To: Jeremy Allison <jra@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Not having much luck building Jeremy's master-smb2 branch (
https://git.samba.org/?p=jra/samba/.git;a=shortlog;h=refs/heads/master-smb2)
on Ubuntu

Anyone recognize this Samba build error and how to fix it?

Waf: Entering directory `/home/smfrench/jra-samba-posix/bin/default'
Selected embedded Heimdal build
Traceback (most recent call last):
  File
"/home/smfrench/jra-samba-posix/third_party/waf/waflib/Scripting.py", line
158, in waf_entry_point
    run_commands()
  File
"/home/smfrench/jra-samba-posix/third_party/waf/waflib/Scripting.py", line
251, in run_commands
    ctx = run_command(cmd_name)
  File
"/home/smfrench/jra-samba-posix/third_party/waf/waflib/Scripting.py", line
235, in run_command
    ctx.execute()
  File
"/home/smfrench/jra-samba-posix/third_party/waf/waflib/Scripting.py", line
573, in execute
    return execute_method(self)
  File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Build.py",
line 231, in execute
    self.execute_build()
  File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Build.py",
line 245, in execute_build
    self.pre_build()
  File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Build.py",
line 542, in pre_build
    m(self)
  File
"/home/smfrench/jra-samba-posix/./buildtools/wafsamba/samba_deps.py", line
1106, in check_project_rules
    tstart = time.clock()
AttributeError: module 'time' has no attribute 'clock'
make: *** [Makefile:7: all] Error 2

-- 
Thanks,

Steve
