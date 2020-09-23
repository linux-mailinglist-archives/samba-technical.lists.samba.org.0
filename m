Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC7275265
	for <lists+samba-technical@lfdr.de>; Wed, 23 Sep 2020 09:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xU8+tn2823H5kJiFbAaRXRno9q52msKvY176L1qXkv4=; b=xhASeBHQDPXEjtUC1QFatw31Ju
	SWmK8E+4CopYK+HZvUPskkBWF1/hRVRwhTdan0qAypHT/WSb6ooT3vophEF3ztC7KNjbXxuOAuC2w
	KcFgH/AIUWxqy7ZNhC7M1IuaSEVol1EQXyU2ddVmJZ6GVAq56s1SJRfmw57IFybsCrbncqllckVYa
	ssKqPLDKm4Zy579+VeZp3OeWC4Y8ffJJLT5r+be2DE32EkLBYUOmQqTmr7544t/RP6TkdTurig4r7
	mXmmSXLaBwucwKO5PTLMCba6ARoGStuRBmqAKW4WxBcCAVPXmuQATn15JH3WNnr1vMcrh2o3X+idS
	RknOMidg==;
Received: from localhost ([::1]:50560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kKzPl-006puN-PC; Wed, 23 Sep 2020 07:42:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35228) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKzPb-006ptz-ET; Wed, 23 Sep 2020 07:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=xU8+tn2823H5kJiFbAaRXRno9q52msKvY176L1qXkv4=; b=iDg5Pj+k9Aw6NJLRLv57mO2NYg
 krkb6jCTgoAhRKtwOwwmDOwh2bsEISNBIDtmfmSarmBxNOTQq+YFU1gXagWaqqS7vqar8XcAqCkN+
 ESe8Bh5epsbR/CrkE4ng5lfwpfb69n8YG9GQkgE9VXWUhCv1AO+cIhL++2A/4Iha5mGGunFwkTWfR
 QJU4T6zHTq3VnjZFb6gsLA/DsHePtN+EWlRRPDJOYYoYOXqrEUcZXq/4fo4EUk6FpER1RSG3aPshy
 I0w0ooyxWP4lFVhOsPR5RAj7n4pvpqM+bRMsiZrd2hmHXGdTseXhdGowGRp/CtYhOPwySPserwSdR
 Kob0GPDWYzoHZ0sRzSLBklLrg97F9/+IZYQOHSAVvBWuMj1AC0mcy9EGrHXpzBRDLp8W19OUjSzqb
 JPJ2PdF63TFqPEVh6CNPVOlGpUMFLiwGz/VDPOFwqhGaWeJxc2d6aliA5qMrW0NiDnOKMoOsU2W1P
 7JFQygEmqCVQLlkCCWR53Q/T;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKzPa-0007w8-2a; Wed, 23 Sep 2020 07:41:58 +0000
Subject: Re: [Announce] Samba 4.13.0 Available for Download
To: Rowland penny <rpenny@samba.org>, samba-announce@lists.samba.org,
 samba@lists.samba.org, samba-technical@lists.samba.org
References: <20200922140620.GA16336@carrie2>
 <f1973153-cde8-dfb0-89b8-de189c0cc5e9@samba.org>
Organization: Samba Team
Message-ID: <c98156d3-04b4-8153-508e-3d149c5589a2@samba.org>
Date: Wed, 23 Sep 2020 09:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f1973153-cde8-dfb0-89b8-de189c0cc5e9@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Rowland,

Am 22.09.20 um 16:23 schrieb Rowland penny:
> On 22/09/2020 15:06, Karolin Seeger via samba-technical wrote:
>> Release Announcements
>> ---------------------
>>
>> This is the first stable release of the Samba 4.13 release series.
>> Please read the release notes carefully before upgrading.
>>
>>
>> ZeroLogon
>> =========
>>
>> Please avoid to set "server schannel = no" and "server schannel= auto"
>> on all
>> Samba domain controllers due to the wellknown ZeroLogon issue.
>>
>> For details please see
>> https://www.samba.org/samba/security/CVE-2020-1472.html.
>>
>>
>> REMOVED FEATURES
>> ================
>>
>>
>> The deprecated "server schannel" smb.conf option will very likely
>> removed in the final 4.13.0 release.
>>
>>
>> smb.conf changes
>> ================
>>
>>    Parameter Name                      Description                Default
>>    --------------                      -----------                -------
>>
>>    server schannel                     To be removed in 4.13.0
>>    server require schannel:COMPUTER    Added
> 
> Is it possible to 'fix' the release notes ?
> 
> 'server schannel' wasn't removed.
> 
> I can see confused users here.

sorry, my fault!
Yes, I will update it now.

Cheers,
Karolin


-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

