Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E163F25B5B5
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 23:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qTy6KOSMSz/9BTADSa72fn7uhVYdIA8H5bFWsX/EAV4=; b=r3Wp/3Rjf2Y/2+VCkuyS1m2VqI
	kuXAipEp4ksDK8VRQzpUIXKDRuhVOll8jYvl/lkefi4pdGVWtO0oAiEI0gVB9wdL+kL768kEoJKYa
	JKk6TfWxbcitj5XYqcFAZqiShIPjfYBiSLumRAFGne9p79dYt+XL25wzr3Nmz6IRWEo5ZkCRSeSVT
	m3163M+vi/8z/1BBt34/RQSlqNA/1T9QFzpzkEEk9rpISVxXLfvZYFnQyF6mEcFnADpTiUr/8OveN
	2sBXXNJqi3sxYjdHzowuHS2CvL4JP5jtxwPESgmPmJg/SM6lt71Y9AMdIC9ncO4t0YQ/h8IJfLttC
	5pTbBCqA==;
Received: from localhost ([::1]:53246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDa3N-003dLl-7g; Wed, 02 Sep 2020 21:12:25 +0000
Received: from p3plsmtpa09-01.prod.phx3.secureserver.net
 ([173.201.193.230]:51290) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kDa3I-003dLe-66
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 21:12:22 +0000
Received: from [192.168.0.78] ([98.118.115.125]) by :SMTPAUTH: with ESMTPSA
 id DZMIkvEuUk62DDZMJkRQV5; Wed, 02 Sep 2020 13:27:55 -0700
X-CMAE-Analysis: v=2.3 cv=Bq/jPrf5 c=1 sm=1 tr=0
 a=gUzUqk5j/8HUPp45KC7Luw==:117 a=gUzUqk5j/8HUPp45KC7Luw==:17
 a=IkcTkHD0fZMA:10 a=-6Tbt3eOoMF7BivNrVsA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: Directory Leasing feature in Samba smbd
To: samba-technical@lists.samba.org
References: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
 <20200826173216.GC16382@jeremy-acer>
 <AE3B2AEB-2208-4840-B88F-103DEF54BFA6@storagecraft.com>
 <20200902192054.GD26967@jeremy-acer>
Message-ID: <52d72e81-a811-3297-2e35-0556e3ab3673@talpey.com>
Date: Wed, 2 Sep 2020 16:27:54 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200902192054.GD26967@jeremy-acer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBmNjfSgzRXfX2pUKg4B5FYL88rrg6dCE5/bt8lODgtEsJiPGBz/GKbSx0rh0/MSQJlNAUVzsTGbm3RxygXmj8FAj1l3xXjS7xhwJWS73nhpCCqVhKCJ
 1cJi70yERCCPD7A372M3Sw0SkHpV25VKSx+fqkmF6jDRlzAgX0oU/mInRMPYu8NT/0rUP/Cfrfk0aw==
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/2/2020 3:20 PM, Jeremy Allison via samba-technical wrote:
> On Wed, Sep 02, 2020 at 05:18:05PM +0000, Krishna Harathi wrote:
>> Jeremy,
>>
>> Thanks for the insightful response on how to start on directory leasing feature.
>>
>> After reading more into Microsoft SMB2/3 directory leasing, in our customer case, looks like the windows client is taking advantage of the granted directory lease and maintaining a directory cache.
>>
>> I am attempting to setup the following even before writing test cases.
>>
>>    1. Using directory lease capable Windows Server 2012R2 (or later), setup a shared folder/directory with a set of files/folders in it.
>>    2. On a Windows client capable of using directory lease , map the shared folder to a local drive letter.
>>    3.  Start capturing tcpip packets on either client or server.
>>    4. Browse the shared folder on the client multiple times.
>>    5. The tcpip dump should show only a single directory scan set (SMB2_FIND_BOTH_DIRECTORY_INFO requests/responses)
>>
>> Is my assumption and approach correct? Is there a better/direct way to monitor the directory lease and cache in the client?
>>
>> Only information I found on Windows is the global configuration values of "DirectoryCacheEntriesMax" and "DirectoryCacheEntrySizeMax" shown with powershell "get-smbclientconfiguration". Are there any stats to monitor to determine that the directory cache is active with entries from the mapped drive that has the directory leased?
>>
>> Once this setup is done and confirmed working, I will have a better understanding on what to expect and I will start adding test cases to smb torture.
> 
> Hi Krishna,
> 
> That would seem to be a good way to explore
> how the Windows client behaves. I don't have
> good insights into how the Windows client
> manages its cache I'm afraid.

I think it's a very risky thing to assert that any particular caching
occurs. There is no protocol requirement for caching, so the behavior
of the client is purely an implementation choice.

It's great to explore but "adding test cases to smb torture" is my
concern. What kind of test cases?

Tom.


> 
> One thing I'd also try is to get wireshark
> logs whilst browsing the cached directory
> and then using the local Windows command
> line on the server, create a file in the
> cached directory - that way you should
> be able to see lease revokation going on.
> 
> 
> 

