Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749B49D11E
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 18:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=umPXzRAToCbQhV5ojHow0H6FeAqNLGs0RF62fAsAilc=; b=OR4YPJ8+hfslOAwrZ1teJYc9JN
	tZhzMPkoAo31DFaoqVOtjdfr8n+vDvaRfcbWoXY47qLLrEf7sMlhBC8OAHMHWPLgZoUtOOK1MvEAb
	HCnPgLWoYvHW4yUOLyWeQJ4IEyuw3U/C2/xoE05GJBhvQYzXG+e+YsOPJzKABXirmLv1lVSw74udH
	K3pc/kp8M6a8oTgFaFz9iKVpAMaDZiYpTFj2FygYdLyv0n2pOk+X7SD1ZP0Q1zfgK3iwj+QRwRAcu
	CsUQtEUK3oKjJeyRXcSH1gK6cjNaqzA9lAREc3WwnNRQgQZVtQAMl0MM4GA7tBblrzpnOGl00ShnC
	8l4ea0XA==;
Received: from ip6-localhost ([::1]:18206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCmOf-0019RH-Ep; Wed, 26 Jan 2022 17:47:53 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:43776) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCmOZ-0019R8-OC
 for samba-technical@lists.samba.org; Wed, 26 Jan 2022 17:47:50 +0000
Received: by mail-lj1-x22a.google.com with SMTP id t7so651634ljc.10
 for <samba-technical@lists.samba.org>; Wed, 26 Jan 2022 09:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=umPXzRAToCbQhV5ojHow0H6FeAqNLGs0RF62fAsAilc=;
 b=AY0AVvAGBVgNH6GUqPrZd9aGzBD/94EP553IIA35zD1T93uv1zNVf1UtzVDpZ/JeZo
 nhyvX300Zw1QQ8aEBzrbzVxgNCyqye0yOxduW+iYMSCoNMHNT5k4pLndpWlbrR1Kz1vz
 kVBFcTvBn12Z1cMck70yzr4ClXPmTR56cLxW3VNacc5bPzf77VBou7xyZjbXX7FxLyzb
 35kSTHJfn8pIXb5bcLWz1VqCDe5jRg821292VkukzjhwN0Ot3Ia6x6XMBjd6uF1Cu/g1
 ZuGKqrYrAA5yvZBjA58eYOoYuOKAj4GPD98AHnjA0jiUyWcmO0vp4pyDdlxBPtnjL6f/
 SUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=umPXzRAToCbQhV5ojHow0H6FeAqNLGs0RF62fAsAilc=;
 b=Kdj1ndqDm8mM55SouJ3jW5A81iZrjiUkUVQL2zBJ56Olsm121s28YGZQJ+Z9AhfAkM
 bHWiH7MSqTsuiJP5Zx0ntHfnZlx6TzsCM4W79OsQBLxcxn7BXGqO03leA0bZ3D0U69ON
 ZNVRu4dCX1+ZtsauL3JKrIDmU1UDU9ZkKydKF94A4wvrlKXokIfolKO1lFSfd6NhqBoi
 1AgHVUNc7clhkPCI49jS92TDWhVrDHKw5AT6khCsBN7/xxCnwGkNgsY7r9yjSMnVe2VS
 JObbCBKIK1ML+/vNRjd5E6gxNGFytA2CiSFW+MpNEcDRM3xhMQA1Jgo8GjgU7TbtYIMR
 IwwQ==
X-Gm-Message-State: AOAM531QFHW4Fz02ObaPTwLFTSDhU5GnHdc6NdHVlDfEkk9V0XyGyS5/
 JvaeE3iQR5bcgjpkkJT2RBor2AQ3VDb0HBOOVApnNlUqWr8=
X-Google-Smtp-Source: ABdhPJz34JAgMRCbIZeapkPVtriTpOkcc1L8CDg3kizt6ALUXqmZXl3wSWMGuiyYSS/4yDKuUflyCxtwp/vWBWAdSSE=
X-Received: by 2002:a2e:9c04:: with SMTP id s4mr94274lji.229.1643219266061;
 Wed, 26 Jan 2022 09:47:46 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
In-Reply-To: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
Date: Wed, 26 Jan 2022 11:47:35 -0600
Message-ID: <CAH2r5msGSpH97r9Y0n_A4+nEXbTgj+2j+9_CnHQwd7Q=a28woA@mail.gmail.com>
Subject: Re: Samba build error: module 'time' has no attribute 'clock'
To: Jeremy Allison <jra@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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

./configure --without-pam --without-ldap --without-winbind
--without-ads --without-ad-dc

It also fails with "--disable-python"


On Wed, Jan 26, 2022 at 11:40 AM Steve French <smfrench@gmail.com> wrote:
>
> Not having much luck building Jeremy's master-smb2 branch (https://git.samba.org/?p=jra/samba/.git;a=shortlog;h=refs/heads/master-smb2) on Ubuntu
>
> Anyone recognize this Samba build error and how to fix it?
>
> Waf: Entering directory `/home/smfrench/jra-samba-posix/bin/default'
> Selected embedded Heimdal build
> Traceback (most recent call last):
>   File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Scripting.py", line 158, in waf_entry_point
>     run_commands()
>   File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Scripting.py", line 251, in run_commands
>     ctx = run_command(cmd_name)
>   File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Scripting.py", line 235, in run_command
>     ctx.execute()
>   File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Scripting.py", line 573, in execute
>     return execute_method(self)
>   File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Build.py", line 231, in execute
>     self.execute_build()
>   File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Build.py", line 245, in execute_build
>     self.pre_build()
>   File "/home/smfrench/jra-samba-posix/third_party/waf/waflib/Build.py", line 542, in pre_build
>     m(self)
>   File "/home/smfrench/jra-samba-posix/./buildtools/wafsamba/samba_deps.py", line 1106, in check_project_rules
>     tstart = time.clock()
> AttributeError: module 'time' has no attribute 'clock'
> make: *** [Makefile:7: all] Error 2
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

