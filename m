Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE441194A
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 14:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=AFtJ0DMMQ3f30fMlA5ZtZvRh7AC4WZnk6RfwAS9kTNA=; b=WXqWPXI/JMysumcceau8pdCCbJ
	P+Z/5D/CY2fBtZli0eZJEotzEc3GBVUTMkEKS39mBhduSGcIjb/VysCYxBXbpIZ+WHoAilto1YhqM
	cSVQea1d3fv6cfNgfW9fZVklHM/61BNwK8dm6sKR1vRw0B1YlefAh+onbP91kecVCOh8sKXDw7U+U
	mJen9pBz6Y4B12HAk7AiBzw8tJ2fb9PCSs7Ma6O+iggNjd7ZV/gO8TvobxtaFp81NZlRsunmSXgKo
	lBLoxZweOBVmvkO68ZZDRUNWF/exbVFZky7qmfqNAzcRQiLNsuyB5BpRyPEta+wO1En3zCnOCvDPA
	A3O5DitA==;
Received: from localhost ([::1]:63472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMB7F-00230U-VT; Thu, 02 May 2019 12:47:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:48534) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMB7B-00230N-5J
 for samba-technical@lists.samba.org; Thu, 02 May 2019 12:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=AFtJ0DMMQ3f30fMlA5ZtZvRh7AC4WZnk6RfwAS9kTNA=; b=kDJkZzJxfxAvX1OClK5n7qiGvd
 NxyJmGAbfyQBPeP7+cjsuOU6zzGtOMJMLDYtnrCuPbXKJIVp3OTFabFvEUYIGLCDESzaw0j4eRVJE
 1gKZnsa9CghLUrvT0XEhH6hUQBOvbYSE+8BBQyHjNB/RY0EVpu5jbQ07wLBQEnt8E64Y=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMB7A-0002xl-Tz
 for samba-technical@lists.samba.org; Thu, 02 May 2019 12:47:05 +0000
To: <samba-technical@lists.samba.org>
References: <20190502204231.60f35912@martins.ozlabs.org>
In-Reply-To: <20190502204231.60f35912@martins.ozlabs.org>
Subject: RE: [PATCH] ctdb-scripts: Drop script configuration variable
 CTDB_MONITOR_SWAP_USAGE
Date: Thu, 2 May 2019 14:47:05 +0200
Message-ID: <8D5F8F0CF9684655A019A5D8B63F3AD0@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdUA08uGKYJXt7UMS3OqQjpRTNXOEgABOARQ
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Marting, 

> Monitoring of swap is based on the idea that swap
> space stacks on top of main memory, so that when a system starts
> filling swap space then this is supposed to be a good sign that
> the system is running out of memory. 

Not completely right in my option. 
Swap can be full while your ram is not. 

Maybe its good to check swappiness also, most distro's have default
swappiness set to 60.
The parameter value set to 60 means that "your kernel will swap when RAM
reaches 40% capacity."
40% ! All other is used for caching and/or services.

This control is used to define how aggressive the kernel will swap memory
pages. 
Higher values will increase agressiveness, lower values decrease the amount
of swap. 
A value of 0 instructs the kernel not to initiate swap until the amount of
free and 
file-backed pages is less than the high water mark in a zone.

Let say 5-10 years ago this was fine, but these days we have much more ram
and swap/swappiness ratio's can be changed to increase performance and lower
IO. 

How you calculate the swappiness ratio to this? 
This is a small formule what i personaly made/use to calculate my (safe)
ram/swap/swappiness ratios. 

In your example of 128GB Ram and 4GB swap
128/60 = 2.133 ratio.   ((128/4) / 2.133) = 15.23 +10 for safety = 25 so
minimaal 25 swappiness. 

That leaves about 32 Gb available for services/caching when its start to
swap. 
Swap starts now at 75% memory filled, and not at the default of 40%, result
in less IO due to swapping. 

Few other examples. Let say 32GB. 

Ram/def-swappiness    (Ram/Swap)
32/60 = 0.533 		(32/4) / 0.533 = 7.5+10=17.5, where in my option
anything below 25 should be avoided.
Try 8gb swap		(32/8) / 0.533 = 15+10=25 , here increasing swap to
8GB is better .. 
Try 64Ram 64/60=1.066	(64/4) / 1.066 = 15+10=25 , same with adding ram. 

256GB 
256/60 = 4.266	     (256/4) / 4.266 = 15+10=25 , so 256, with 4GB swap,
could use swappiness 25. 

What if you only have 2GB ram, with 4GB swap. 
2/60=0,005			(2/4) / 0.005 = 100 +10 = 110, which means
to me, not enough ram expect swapping. 

What if you only have 4GB ram, with 2GB swap. 
4/60=0,066			(4/2) / 0.066 = 30 +10 = 40, which looks
safe to me to avoid swapping and use max ram/caching.

(((RAM:"swap size") : (RAM:"default swappiness")) + 10(safety) = possible
safe swappiness value. 

Maybe worth checking this out. 
This is what i've learned in last 20 years of linux use. 

Unsafe ranges for swappiness 0-24.
Resonable, swappiness 25-39.
Ok for average use 40-59. 
Default 60.
Avoid 61-99
Above 100, not enough ram, expect lots of swapping. 
Setting swappines to 0-20, is an option but then you can expect OOM killer
messages .. 

Im not calculating possible need of suspend-to-ram(sleep) or suspend to
disk(hybernate). 
Since we dont use that on servers. 

Source: https://www.kernel.org/doc/Documentation/sysctl/vm.txt

I hope you can use it. 

Greetz, 

Louis
 




> -----Oorspronkelijk bericht-----
> Van: samba-technical 
> [mailto:samba-technical-bounces@lists.samba.org] Namens 
> Martin Schwenke via samba-technical
> Verzonden: donderdag 2 mei 2019 12:43
> Aan: Samba Technical
> Onderwerp: [PATCH] ctdb-scripts: Drop script configuration 
> variable CTDB_MONITOR_SWAP_USAGE
> 
> CTDB's system memory monitoring in 05.system.script monitors both main
> memory and swap.  Monitoring of swap is based on the idea that swap
> space stacks on top of main memory, so that when a system starts
> filling swap space then this is supposed to be a good sign that the
> system is running out of memory.  Additionally, performance on a Linux
> system tends to be destroyed by the I/O associated with a lot of
> swapping to spinning disks.
> 
> However, some platforms default to creating only 4GB of swap space
> even when there is 128GB of main memory.  With such a small swap to
> main memory ratio, memory pressure can force swap to be nearly full
> even when a significant amount of main memory is still available and
> the system is performing well.  This suggests that checking swap
> utilisation might be less than useful in many circumstances.
> 
> So, remove the separate swap space checking and change the memory
> check to cover the total of main memory and swap space.
> 
> Test function set_mem_usage() still takes an argument for each of main
> memory and swap space utilisation.  For simplicity, the same number is
> now passed twice to make the intended results comprehensible.  This
> could be changed later.
> 
> A couple of tests are cleaned up to no longer use hard-coded
> /proc/meminfo and ps output.
> 
> Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/59394125
> 
> Please review and maybe push...
> 
> peace & happiness,
> martin
> 


