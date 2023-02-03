Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A43268A0D2
	for <lists+samba-technical@lfdr.de>; Fri,  3 Feb 2023 18:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=aagg1U7KCOdBmV5KJA1EDdN+uGOyqFKMM6H0hmVSPHw=; b=NdjDMrWmfHWHBFhQTFANrhvoL/
	nSkzLRdKy8PcigCf/JhyEmbPgo+zEYarwYRTkqvCrCzPBMQh0+tgHmqdvw+GLNXUg6y7RIrbF4ULI
	UvPDN2kcWvnxG3F228xL+2Q6SrkYTn0E4D2Cegu72LxD4otjNloA8yx2Y1gCO9cpUY5rAeOAV+CaJ
	yEup6c0KWoYCS1X5leewvN6QvTBZyNBxzGZO+gkksq7QztrfCN/g0Y2qSBLCbRgPV57iQt4SnqKwe
	Z8gEqvzp+b/Sh27Wk623dVHaf2yzxjcJlyzFW5tq107Z9x3xAxE3uGWbR4uPAarVySHG/f/RV7VFF
	E++3vS+w==;
Received: from ip6-localhost ([::1]:48416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pO0D9-008cYD-Kl; Fri, 03 Feb 2023 17:50:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26718) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pO0D4-008cY4-Gd
 for samba-technical@lists.samba.org; Fri, 03 Feb 2023 17:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=aagg1U7KCOdBmV5KJA1EDdN+uGOyqFKMM6H0hmVSPHw=; b=fBK7aYyA6+Ix1uEfcc31JuPQpt
 BdJLUROGVayRGmso9/u0YhVDrfs40qrIGS965UmOUuK6kLb/JWhuz/ps5WQKSX/2YfLg7yk6HWR5W
 xmWxoj4hzArnd1XS8qMX3KNmWta6Yq4deDdABEyLOWkR//fYNmlpPdAn4Ai/7jHv/8uRhrZDcknbV
 GWs5hZZbaLXjEFLDsUnZuHgMM9K8H7nY0Pmwo/zU44iaEHrhLeNSdib8kOnaCOxmqtOO52VoT7pS4
 uEi3/wjV73LF6GHOCSm4+OgySFdtKC+6GxHSU03tn4x8FaX73ntGTZbA6EXzJRxQgJgVJFK/hMXHD
 C43vhhwljhiNlsrKLLx+gGJDT1SOSzWBr6YIvB8yffaTxHAf+qcHQhvl8IY7PxhNFg8nrs/r+BkiX
 qtWkBHNe+nqOX5TzStqbZDpQZcvtM+WhZKl0DzIQxgpoUGxuXmZN3WZPE1C7ZM6CmiTlDo+f47sUf
 BVWIIFC1VHNgsyin1mtHIgb/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pO0D3-00Bd0C-2O; Fri, 03 Feb 2023 17:50:49 +0000
Date: Fri, 3 Feb 2023 09:50:46 -0800
To: varun mittal <vmittal05@gmail.com>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
Message-ID: <Y91JdhAtd41n9C7O@jeremy-acer>
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
 <Y9QuBd7wf9hfbpT5@jeremy-acer>
 <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
 <CA+RDaRAY7WLbZf=8Bp=jA0X435SvoQLFv7EK-WcbFCpPy67S4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CA+RDaRAY7WLbZf=8Bp=jA0X435SvoQLFv7EK-WcbFCpPy67S4w@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 03, 2023 at 08:51:57PM +0530, varun mittal wrote:
>   I was able to narrow it down to the "Named Streams" bit in
>   "FileFSAttributeInformation" response.
>   When this value is toggled from 0 to 1, as is advertised by
>   `streams_xattr` VFS module, Robocopy
>   switched from FILE_OPEN to FILE_OPEN_IF.
>   Thanks

Thanks for tracking that down. What strange behavior.
I can't see why having a stream would make the open
change to optionally creating the file, but it's good
info to know. Thanks for posting the follow-up to
the list !

