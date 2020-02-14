Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD015F6BC
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 20:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=97vMM0MBbQ9ghyOAxk72i+PK3Xh+yRFbYxPf5SSOWE8=; b=qWCIYmHTUHaUfchaANftXPVQNB
	Nv6zBcm8kK6BNTd1PZelHif+TnqBCi3KPdLy+KbOYAJoEflCPW+8VOFaG2VZGwxns6tUr86INQDwO
	tVskCA4dPRxPRK26SU5vUCe8wkkGrHBWF69kggalV6u98RPXTRaoPIOcWxDR61QTedrmj4kkw12SN
	ZOdBeUjjyU7rAKCK8qdiqBTNt/q67WYyMeNLrqfSy9xxqs0xiV9Dnnty3RBDH503j3tWKLu2bLNTF
	rY6IBDJOcHFAf3DcUJE5pRCPcb9AGoC603SJ6LDGsRov+JcPiEjenqeea67yf6X0ptpGIaQLcFOWN
	WQ2XnA+w==;
Received: from localhost ([::1]:40076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2gXg-009vyN-CQ; Fri, 14 Feb 2020 19:22:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50968) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2gXb-009vyG-Dd
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 19:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=97vMM0MBbQ9ghyOAxk72i+PK3Xh+yRFbYxPf5SSOWE8=; b=NN7JNEM9qeUA4UG1isH1kuiwuY
 bmn61XUPROX0URKgnPQQ22vJvmDtVNiMnqfOoRNUvC1nT7p+PSr2AG08dMAkq3o+yIFcMoQGB1ZGk
 0Q+TmVYZnp/QqB+nGnoCZgc3DImIx/YLF+lyCwkwzUIgMBJ7kIej4GpaqwGDfi4dxT/peSB09Gg1q
 ptMex9EJ7ZR+MCb9xBbzv+LRT1S3huRzYFxz7Fmg2w6Ka0AxjIKzEBKQZqibOjriI1K9F1YB29Xzt
 9XVIvqe2WTTy2BJiQpQtnTMJx5wrzGxE0GcDTdRrQreZ9h/0uT/rjUbfPGrJU0hKFKCerWx0H1Mcm
 QIEp86DSEy+h2HvlQm7Mte/wgFVnL+Z/4s9dzQAW6JAdwzbdnBdPg6X1+EhfDfYs7Oekzt+IcrVCm
 Lki8UDA910ZsZr5aGsQRZYQQPjCLDm/nygcj9hHTSm7Qxu1GwRZXctMfjvqXRzi/8FmArmOn8EyA+
 j48gw5F9BBnHHppjvUOn+Pwn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2gXa-0003He-Lv; Fri, 14 Feb 2020 19:22:18 +0000
Subject: Re: QNX6.6 cross-compilation problem
To: Nicolas Pinault <nicolasp@aaton.com>, samba-technical@lists.samba.org
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com>
Message-ID: <116a320e-62d5-b51e-0b0d-7c0709237d0c@samba.org>
Date: Fri, 14 Feb 2020 21:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

That looks like something in Waf or in the Samba configuration scripts
that Waf runs. Waf 2.0.x which is used by Samba 4.11.x has a worker
process pool to carry out build / test jobs, and this pool seems to be
stuck - won't execute a simple compilation command to run a
configuration test.

Which version of Ubuntu are you using exactly? What version of Python?
is it vanilla Samba or did you use patches?

I don't have access to QNX toolchain, but if the problem is with the
Samba build system and the build machine (as it appears to be), then
perhaps we can reproduce this without the specific toolchain.

Thanks,
Uri.

On 14/02/2020 11:17, Nicolas Pinault via samba-technical wrote:
> Hi,
> 
> I'm trying to cross-compile Samba (V4.11.6) for QNX6.6.0.
> For this, I've installed QNX dev tools on Ubuntu in a VMWare virtual
> machine (My PC runs Windows10).
> 
> To cross-compile Samba, the command I run is :
> CC=ntoarmv7-gcc AR=ntoarmv7-ar LD=armv7nto-ld GDB=armv7nto-gdb
> CFLAGS=-I/home/nicolas/qnx660/target/qnx6/usr/include waf configure
> --cross-compile --cross-anwsers=qnx.txt
> 
> I filled the unknown fields in the qnx.txt as requested.
> 
> The configuration runs till it hangs at this step :
> ...
> Checking for pthread_mutexattr_setrobust_np : not found
> Checking for library
> pthread                                                      : no
> Checking for pthread_mutexattr_setrobust_np : not found
> Checking for declaration of
> PTHREAD_MUTEX_ROBUST                                  : not found
> Checking for declaration of PTHREAD_MUTEX_ROBUST (as
> enum)                        :
> 
> Sometimes, configuration hangs one or two steps earlier.
> 
> bin/config.log shows :
> ...
> #include <pthread.h>
> 
>  int main(void) {
>                       return (int)PTHREAD_MUTEX_ROBUST;
>                       ; return 0; }
> 
> <==
> [1/1] Compiling
> [32mbin/.conf_check_c3306603f996021a8dd585a3c7167deb/test.c[0m
> 
> 
> While the configurafion is hung, ps-ax shows the following :
>  8302 pts/0    Sl+    0:08 python3
> /home/nicolas/samba/samba-4.11.6/buildtools/bin/waf configure
> --cross-compile --cross-answers=qnx.txt --jobs=4
>  8304 pts/0    S+     0:00 /usr/local/bin/python3 -c #! /usr/bin/env
> python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path =
> "/home/nicolas/samba/"  import ...
>  8305 pts/0    S+     0:00 /usr/local/bin/python3 -c #! /usr/bin/env
> python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path =
> "/home/nicolas/samba/"  import ...
>  8306 pts/0    S+     0:00 /usr/local/bin/python3 -c #! /usr/bin/env
> python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path =
> "/home/nicolas/samba/"  import ...
>  8307 pts/0    S+     0:00 /usr/local/bin/python3 -c #! /usr/bin/env
> python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path =
> "/home/nicolas/samba/"  import ...
> 
> 
> When I comment out "Mutext Robust" tests, the configuration hangs much
> further. But it hangs.
> 
> As I thought it might be a concurrency problem, I tried with --jobs=1
> option.
> This does not work at all. Exceptions are generated at the very
> beginning of the process.
> 
> 
> I also tried using --cross-execute option. Same problem.
> 
> 
> I spent days on this problem, trying different things but I'm stuck at
> this problem.
> 
> Any pointers ?
> 
> Regards,
> Nicolas
> 


