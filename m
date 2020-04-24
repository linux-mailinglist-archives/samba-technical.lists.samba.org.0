Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02C1B7122
	for <lists+samba-technical@lfdr.de>; Fri, 24 Apr 2020 11:44:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zi1hsKdefrvC2hHJ+0s0ZX+vgszblf8FauV8SALqDqs=; b=QZboCosyptqDwLjeqaf19E4Yt0
	RqZcDTGhuuY2hMwrr3P363Gt7NvS+H8Kg9R8ZjO4ZXgjKgvw1ZcZHuYp9+UsM8UeV0b1Iswo9EJxw
	Fg6jD5Dpu0aR2Pag8KEkcasy/uqTYyhBHH4MQlZq0swTwDZYyx+XJ6IGxSuHcjyYbdoH/y15/GWot
	55v5r365SoaJyx/rrpUH0qmmWP/G+ni/Csimophh5SQzwrBgYArXd9g2pTiUrqsK77z/2RC1lsdHD
	KNlknpSG9N/6ZE7EW00GYEAWtnmHUxHPBQ3Nfgll++2/LoS2zW+s/UoM/WhVwHztYTDdodvCF5SLV
	sES/tbSg==;
Received: from localhost ([::1]:43668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jRusE-001qv5-T0; Fri, 24 Apr 2020 09:43:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jRus8-001quy-SR
 for samba-technical@lists.samba.org; Fri, 24 Apr 2020 09:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=zi1hsKdefrvC2hHJ+0s0ZX+vgszblf8FauV8SALqDqs=; b=zn3Cw/NTdSlad60jZa03NleIzD
 QYm3OPduL5ZjhW5uJaEkN1CBfK3yfaTguMnySWzPqRZF/oEMlUL05rrUmY4V9YwTkAVpqdZgRrqkp
 rQLVk4tT6fhHP1od8ykhCJDSqS5Mf1i41NnfAgUrc5PWxKkDcSYTxm+/imbCUq6iGVtmXDuGpf4LY
 ALIXGuRFMPNSsTrP5nGOGWI9swHJ+Au423T5791294RbG1by21zlHVKfAgVaIt4LuiqnLwXqMyair
 Xt0ZN1xo19WbaebfaOtGMJkjbVQ7WpYXPvHYiwK3sNJgTtlIZ06clY0vSQCclsLQP6UxuqJJ1i3cU
 revNnaLUZUiJmLUEl6Mano6YsZ2/i34SiRqYGFuZpKyS/GRGLNFI9ByCUIIQYhECxG9ppIjrSnY9c
 P9WVOI4POwwnE655zvYEfaXYwVMglVKfd88UCzOxWQGVmwXj3U8H8oeS8TWZWj0AGdD5wxw0/IIQC
 wWesq+7r2YpzdNGAlZA3ATxz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jRus8-0001Xd-Bi
 for samba-technical@lists.samba.org; Fri, 24 Apr 2020 09:43:48 +0000
Subject: Re: build - ldb depends on missing system library/libraries
To: samba-technical@lists.samba.org
References: <b88fbfaa-969b-8825-568c-741187b8d014@yahoo.co.uk>
 <vmime.5ea2b24d.c07.7d78521b66566a9d@ms249-lin-003.rotterdam.bazuin.nl>
Message-ID: <23ed6102-3997-6989-f5b7-3b54d40d3ac1@samba.org>
Date: Fri, 24 Apr 2020 10:43:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <vmime.5ea2b24d.c07.7d78521b66566a9d@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 24/04/2020 10:33, L.P.H. van Belle via samba-technical wrote:
> Hai,
>
> That only shows building and prepairing for a build from source
> and not a setup for creating packages for samba.

Well possibly, but if you do not start with all the required packages, 
then you will get problems, no matter how you build Samba.

Rowland



