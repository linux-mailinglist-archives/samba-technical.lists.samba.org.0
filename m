Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEF438D786
	for <lists+samba-technical@lfdr.de>; Sat, 22 May 2021 23:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:subject:cc;
	bh=T5vNC7r9WE023ZuIlje9KdteHWE1igKAH1lrdnJczqQ=; b=m/dLvJlfmZ+xea234LGsPmmnHl
	VsUHtsASp0Q70S8p2C5lHby40LHHSiHDGPdbk0F+VHdyX26MRNKu8uSIfACLfDNLy7brQqtQsDubo
	HzLKOFhpU7jFAM775gfOviFkN6GE4m7c8R/iAhRV0nlAj/l5/mQG5EOoE0OgJhHXquddSqErkVwQR
	LniOfXJJiGPOEJsE0K/VM9I67XiRV2/V7nNvKAbhRkF1yGBtDTei0q/WeMwFEAtxgityoD3TET12/
	ye02cpMBOVJWyz2dYHlKTvfayW3I1/rw3BlO4pYwoOFblVZ7ORmqObujbAF0c7NZF3DS1lFN6GytX
	Pq7uGRYA==;
Received: from ip6-localhost ([::1]:47934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lkZ8r-0036FO-GC; Sat, 22 May 2021 21:26:41 +0000
Received: from mail.itsd.de ([80.153.216.99]:28258) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkZ8j-0036FF-SO
 for samba-technical@lists.samba.org; Sat, 22 May 2021 21:26:37 +0000
Received: from mail.itsd.de (mail.itsd.de [192.168.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securemail.itsd.de (Postfix) with ESMTPS;
 Sat, 22 May 2021 23:26:29 +0200 (CEST)
Received: from nero.itsd.de (unknown [192.168.0.223])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.itsd.de (Postfix) with ESMTPSA id 3D8B0800D6;
 Sat, 22 May 2021 23:26:29 +0200 (CEST)
subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: Andrew Bartlett <abartlet@samba.org>,
 "samba-technical@lists.samba.org (samba-technical@lists.samba.org)"
 <samba-technical@lists.samba.org>
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
 <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
 <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
 <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
 <b6fb9ef1-3cbf-e970-eb2e-9e6e395c65ae@itsd.de>
 <b83d52e7a5b846fd429811616f3b3c21d2f55480.camel@samba.org>
 <56d3287c51dc769806d8a4966b54e2a6e672d8b0.camel@samba.org>
 <fd178861288df9613902ecec24e52f6a2786cea9.camel@samba.org>
 <644dd37c-1260-ccd4-f1ff-0bc32c7b3a64@itsd.de>
 <97b1240df9a3ec4b465a3e335037591dd803c029.camel@samba.org>
 <7225391f8125266c5ac85e2a28572e9942c440a5.camel@samba.org>
Organization: itsystems Deutschland AG
Message-ID: <0df4f538-c7d9-675b-5b08-27b7c94bc2a3@itsd.de>
Date: Sat, 22 May 2021 23:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7225391f8125266c5ac85e2a28572e9942c440a5.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SM-outgoing: yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=itsd.de; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=lx8vJeGci
 XnpODkaYKIHPt8e3vQuHb2u44D4I1yLu+0=; b=ELSoDRzTOsWfxi6eiPl/VdoKI
 u2/5Z0zVHqhbztptDxBQW92b+YVeglxGzGKAtfrJsbsgF/ReX8Oqe3j5jeQx0YaE
 5R/kY8YkudCu7gDSa+rKRZz6TDHPA+JseyBt0iqK3u66i+1MHlyDdIxckoW/gzK7
 5BqnRSbIqEuOCjTDaC76hn25nbJq1BZl7X9m6NWctQQKxCX22nlKqY3Lq90U9buZ
 UR56ojGjF18ODC/ipRKguc2BpBFWGLXTfCXHdZ2zpXkDzHvW5mABr/R6iRVTkpCI
 kYjO4Zad9oHnRdGEHsoKS6xlGX5ieH91mu5WU5cIiokmRAa9BKt6LnBfKPdRA==
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
From: =?utf-8?q?Dr=2E_Hansj=C3=B6rg_Maurer_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Dr=2e_Hansj=c3=b6rg_Maurer?= <hansjoerg.maurer@itsd.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 22.05.21 um 00:19 schrieb Andrew Bartlett via samba-technical:
>
> I've pushed an updated patch that should work for other things as well.
>
> Andrew Bartlett
>

Hi Andrew

this one works too.
Thank you very much!
Very impressive how you manged it to fix a problem in such a complicated 
code area in such short time!

Regards

Hansjörg





-- 
Dr. Hansjörg Maurer
itsystems Deutschland AG
Erzgießereistr. 22
80335 München
Tel:   +49-89-52 04 68-41
Fax:   +49-89-52 04 68-59
E-Mail: hansjoerg.maurer@itsd.de
Web:    http://www.itsd.de


Amtsgericht München HRB 132146
USt-IdNr. DE 812991301
Steuer-Nr. 143/100/81575

Aufsichtsratsvorsitzender:
Stefan Adam
Vorstand:
Dr. Michael Krocka
Dr. Hansjörg Maurer


