Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC14704F4
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 16:51:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wqMFe8C5EYQr+U91sJ2YI4Msrmwj1m5LFWUhry7YC44=; b=La5/BOhSauclrK5YGtDnOOqj/n
	C5JFEHWmallq4uhz1d8IBYDn0UwkE67FirYl1FS38+JDN+pi26dpKwVHSvv208qzyW1oyR13wW2+S
	2v0qwhJIdSGlldKDB1leyrbz1xGCg8IwreV+aO2Xn+C6bRhsNGkvblAff1iDPtPLFBzl7fT51HqqV
	8XmIfiynhQmUi9X555nnuzWtA3BMReeHRwr/erVGKLGsSfqf1dkrEcAXnV1FrAu8NqvurSLTDK3Q7
	1vGkSE4xh266IwVbh5+Agm/+8bK73ZxGPDEWVub9mEMry6DNyk3kaUdKEDR0DahOo/kSe48KVVOCa
	y4S6EaLg==;
Received: from ip6-localhost ([::1]:28406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mviAw-004xUy-Am; Fri, 10 Dec 2021 15:51:10 +0000
Received: from p3plsmtpa09-06.prod.phx3.secureserver.net
 ([173.201.193.235]:40980) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mviAn-004xUo-9d
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 15:51:06 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id vi8WmdrmfDmxfvi8XmlzAx; Fri, 10 Dec 2021 08:48:41 -0700
X-CMAE-Analysis: v=2.4 cv=cbsXElPM c=1 sm=1 tr=0 ts=61b376d9
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=JGzCCA8J0NjzivTIANMA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <5815c83f-0bea-53bf-7ec9-49b39e3b3424@talpey.com>
Date: Fri, 10 Dec 2021 10:48:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>, Andrew Walker <awalker@ixsystems.com>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
In-Reply-To: <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBrack628zkzO8BAqsCvhP8Cbtp3KwiHMuIiVH5kiGS7fnBi44kclIzTuWtHrOpXG7F7qarGrAHfjC7VUPLgmI0A+1VAeORMNsRsucQbAbpD1eGZ7Z3n
 Pn2BIofarDY+BfcdXz+TdFajkAoboIZcFSjwQFJNGBeDyxCIB5BzAVxVQI1d7WCnSkimKPB64EBu9J0RaEBArTmorZCkNVsIuiON40HPoMEcWfZCWMYO+DSs
 cBN3Joc0G2L3iCvb+xgwnvv440+upgf9iCw6GtkFXY8=
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for these, I'll catch up on reading, shortly.

MS-FSCC section 2.1.9 defines the identifier that MS-SMB2 calls
the DiskFileId. Clients typically use it to perform caching,
which is to say, it's going to be an upper layer issue - the SMB
protocols don't actually process it, they just pass it along.

Ralph, if you set it to 0 or ffff, it may "work" but the file
might not be cached. That seems undesirable. Is this issue
purely on Macs?  What actually fails, and what works?

On 12/10/2021 8:18 AM, Ralph Boehme wrote:
> On 12/10/21 12:49, Andrew Walker wrote:
>> Correct?
> 
> exactly. Thanks for digging out the references. Didn't remember I ever 
> wrote such a comprehensive summary. :)
> 
> So what shall we do? Back to inode numbers? I've been recommending 
> fruit:zero_file_id=yes to customers who've been reporting strange issues 
> with Mac clients. That causes Samba to return 0 file-ids which has been 
> problematic in the past, but it seems to be working atm.
> 
> Tom, do you know if it using any of the mentioned fallbacks from MS-FSCC:
> 
>    For file systems that do not support a 64-bit file ID,
>    this field MUST be set to 0, and MUST be ignored.
> 
>    For files for which a unique 64-bit file ID cannot be
>    established, this field MUST be set to 0xffffffffffffffff,
>    and MUST be ignored.
> 
> would be a way forward? Macs can deal with 0, not sure about UINT64_MAX.
> 
> Thanks!
> -slow
> 

