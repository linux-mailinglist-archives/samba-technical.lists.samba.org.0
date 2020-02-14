Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFE15D4B1
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 10:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=wVkZmL0Ww4s4ptwv8IndcpMaOmIM8ig6nG3wKP+R9wY=; b=CFk3/N8J3amqhb8vlfiX5veaAT
	12pd4086iVTgruroKeq/mFB1uFcTfPmHk17NzF6TqBVuZv55xouNgBgDFfd67/6VkCE2H0Hv03f7V
	itnALzRo+mxzEqZjPcvN+zPnw7NjQZUFay0VAVEGE2xyToFU08lPngiHtebXMrVDKvF22AztJ12CL
	Mj0ulq1EM+Rl1//yj1t3g3wCRI/UWu2gGiBJbakBGITwYKslY1Dhlh0MSM4pqojlORMSJP2Efo2LU
	+CC5eoHWlGrHs3si8VjhDu/R2hFUs9gFhpqCCM0LlSIltW0XvVvEuxhiTuN8HkpHZ5YuL3Y2VuvO4
	rhb61+6A==;
Received: from localhost ([::1]:61478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2XFu-009rlF-Mu; Fri, 14 Feb 2020 09:27:26 +0000
Received: from filter1.mail4ce.com ([2a0b:f380:0:1:10::3]:36875) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j2XFr-009rl8-0f
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 09:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aaton.com; 
 s=_key;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wVkZmL0Ww4s4ptwv8IndcpMaOmIM8ig6nG3wKP+R9wY=; b=3guxJLh5cUx2PijJ47fB9o2bT7
 ZJKGeASx5dxWywkvQrMYFqHzfVoQUBW7b5W2Q4RX5wmxYi5LuM8eTtXe+kdHbvo6J83KQg9Q/+4sw
 JMkh/kcOxmCFmEqKyMPg3GZjs8k/hyHPaCxgLnBTCkQig9/Vuw0QaNfcjT8a+Jf5luEE=;
Received: from [195.101.33.1] (helo=[192.168.2.16])
 by filter1.mail4ce.com stage1 with esmtpsa (Exim MailCleaner) 
 id 1j2X6d-0001zM-VD for <samba-technical@lists.samba.org> 
 from <nicolasp@aaton.com>; Fri, 14 Feb 2020 10:17:52 +0100
To: samba-technical@lists.samba.org
Subject: QNX6.6 cross-compilation problem
Message-ID: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com>
Date: Fri, 14 Feb 2020 10:17:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-MailCleaner-RDNS: invalid reverse DNS for 195.101.33.1
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
From: Nicolas Pinault via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nicolas Pinault <nicolasp@aaton.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm trying to cross-compile Samba (V4.11.6) for QNX6.6.0.
For this, I've installed QNX dev tools on Ubuntu in a VMWare virtual 
machine (My PC runs Windows10).

To cross-compile Samba, the command I run is :
CC=ntoarmv7-gcc AR=ntoarmv7-ar LD=armv7nto-ld GDB=armv7nto-gdb 
CFLAGS=-I/home/nicolas/qnx660/target/qnx6/usr/include waf configure 
--cross-compile --cross-anwsers=qnx.txt

I filled the unknown fields in the qnx.txt as requested.

The configuration runs till it hangs at this step :
...
Checking for pthread_mutexattr_setrobust_np : not found
Checking for library 
pthread                                                      : no
Checking for pthread_mutexattr_setrobust_np : not found
Checking for declaration of 
PTHREAD_MUTEX_ROBUST                                  : not found
Checking for declaration of PTHREAD_MUTEX_ROBUST (as 
enum)                        :

Sometimes, configuration hangs one or two steps earlier.

bin/config.log shows :
...
#include <pthread.h>

  int main(void) {
                       return (int)PTHREAD_MUTEX_ROBUST;
                       ; return 0; }

<==
[1/1] Compiling 
[32mbin/.conf_check_c3306603f996021a8dd585a3c7167deb/test.c[0m


While the configurafion is hung, ps-ax shows the following :
  8302 pts/0    Sl+    0:08 python3 
/home/nicolas/samba/samba-4.11.6/buildtools/bin/waf configure 
--cross-compile --cross-answers=qnx.txt --jobs=4
  8304 pts/0    S+     0:00 /usr/local/bin/python3 -c #! /usr/bin/env 
python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path = 
"/home/nicolas/samba/"  import ...
  8305 pts/0    S+     0:00 /usr/local/bin/python3 -c #! /usr/bin/env 
python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path = 
"/home/nicolas/samba/"  import ...
  8306 pts/0    S+     0:00 /usr/local/bin/python3 -c #! /usr/bin/env 
python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path = 
"/home/nicolas/samba/"  import ...
  8307 pts/0    S+     0:00 /usr/local/bin/python3 -c #! /usr/bin/env 
python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path = 
"/home/nicolas/samba/"  import ...


When I comment out "Mutext Robust" tests, the configuration hangs much 
further. But it hangs.

As I thought it might be a concurrency problem, I tried with --jobs=1 
option.
This does not work at all. Exceptions are generated at the very 
beginning of the process.


I also tried using --cross-execute option. Same problem.


I spent days on this problem, trying different things but I'm stuck at 
this problem.

Any pointers ?

Regards,
Nicolas

