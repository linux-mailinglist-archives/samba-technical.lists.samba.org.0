Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D01317F5736
	for <lists+samba-technical@lfdr.de>; Thu, 23 Nov 2023 05:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=tlSvVlBlbXpG3chyl8RSF0vbLx1ntyX3IF/+ZfbFMcA=; b=Gnkf1bEy/ktGxgSiXRhMUnhUf5
	uBLkQYq88ArIruRT3cNqTci3D1hZSSlcL4YOhtWlNlRdo1YAXr0TVzpZobv/urTqnpiK1cUrNG32r
	LknEHZYaJXv9jmPYYOQjgJkQMcohajQH+f7+UWv0/66xr1YYDWebEoPCqDbS1zcmU0djYxBPuLQ4p
	QCO1pv/Oy+dxRUYSTUD1+WS3AGIdqYJtTyR7o21aS+nucYQnK6bwC4MS/mIXd5nBCmMOnjmYeF6FS
	plMWvgMfts3zA66ClncG94Ua2eSGSdjYnUodkHdPAAFnowWbrNRZnDKhrvFi9wxs9MZ0YKH/RgJ+l
	im5MprrQ==;
Received: from ip6-localhost ([::1]:27998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r60wL-000Jpt-OL; Thu, 23 Nov 2023 04:03:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56842) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r60wD-000Jpk-DQ
 for samba-technical@lists.samba.org; Thu, 23 Nov 2023 04:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=tlSvVlBlbXpG3chyl8RSF0vbLx1ntyX3IF/+ZfbFMcA=; b=BhQLbeuMiwPk5tPKEK8r3oFiWJ
 R2KMvGxthH44u/gx3GzMooSxPMNxb8s+3oWC5nLXAXGIEfWFjJ3Al+PfBJdMl6oRhhPdN4jruIzcH
 +3xvVwaTDNOLT7LMNkt3S5kYDyRRJqui2cOTqnptYFErRud52K1+E9YXpPiqGYfLvEKmDmgwd21sV
 wMmTbPC/EH0xOGC0ZKCxzqmdyRSGBJE5FPZVUInI5zVmmCHHzgfDgtYkJB4/z28NUu+T9dQSGaVy+
 11wcjhOJaPiO0o1ZwGWyU7IWLZH/o/ttAGkBn1TxTo8gr8pe2bBSJ5e1bLqcb8CC5VkLOtnM2mrO6
 Os2ETHbG/J80pNpK2nmnrGOYB5Y+9amTrT97PxR8O4JlkQfXvpATCfG1ssW8H3uMXHTE6OhyNZak0
 stps0zomsyPKSgsLatKD8mpovD5YxNmwgh+aCk1Hmp+wav+3lyqhZG0fVWgJY+ur6eewKTrRbp/6B
 5j6J2GMrdZ35sS2XjNROhRvu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r60wB-0007K2-0n for samba-technical@lists.samba.org;
 Thu, 23 Nov 2023 04:03:36 +0000
Message-ID: <c213b2e8-667d-4f32-9159-c11250c83573@samba.org>
Date: Thu, 23 Nov 2023 17:03:33 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suggested crypto libs for Diffie-Hellman and Eliptic Curve
 Diffie-Hellman
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <81c7b2c93303aa93bc3b6747c7935e040afff238.camel@samba.org>
 <2320390.ElGaqSPkdT@magrathea>
 <107f4011e2de161a39d88a8c9698917b0e9dd75d.camel@samba.org>
 <562781ab-14db-4858-be0c-d1dad20f852e@samba.org>
In-Reply-To: <562781ab-14db-4858-be0c-d1dad20f852e@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 23/11/23 10:05 am, Stefan Metzmacher via samba-technical wrote:
> Am 22.11.23 um 21:26 schrieb Andrew Bartlett via samba-technical:
>> On Wed, 2023-11-22 at 12:07 +0100, Andreas Schneider wrote:
>>> On Thursday, 16 November 2023 07:08:59 CET Andrew Bartlett via samba-
>>> technical
>>> wrote:
>>>> For Group Managed service accounts, which we are working on, for
>>>> reasons around RODCs and a few other things, Microsoft has decided
>>>> to
>>>> internally use a key-agreement between a 'root key' and a 'service
>>>> key', both held in AD.
>>>>
>>>> The password comes, as I understand it, from the key agreement
>>>> derived
>>>> out of a Diffie-Hellman or Eliptic Curve Diffie-Hellman exchanges.
>>>>
>>>> This is all in MS-GKDI, referenced from
>>>> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/9cd2fc
>>>>
>>>> 5e-7305-4fb8-b233-2a60bc3eec68
>>>>
>>>> I just wanted to check if there are particularly cryptographic
>>>> libraries we should consider for this work.
>>>>
>>>> In the past we have looked to libnettle when gnutls didn't provide
>>>> the
>>>> functions we wanted, but that was backed out fairly fast as another
>>>> method was found (
>>>> https://bugzilla.samba.org/show_bug.cgi?id=13276
>>>>   0784
>>>> 4a9a13506b4ca9181cfde05d9e4170208f88).
>>>>
>>>> Even so, for this case is libnettle still the best first place to
>>>> look?
>>>
>>> If something is missing in GnuTLS you need, open tickets at GnuTLS.
>>> They are
>>> fairly quick implementing the stuff we need.
>>
>> The main issue is the time to get the changes into the distributions so
>> we can get them into master, but yes, it has been an awesome
>> collaboration.
>>
>>> They implemented all the features we needed for Samba so far.
>>> Example:
>>>
>>> https://gitlab.com/gnutls/gnutls/-/merge_requests/1611/
>>>
>>>
>>> Also AES-GMAC, AES-CCM, AES-CBF8 ...
>>>
>>> They also fixed performance issues we discovered ...
>>
>> Thanks.  It looks like we won't need the DH stuff, thankfully, but we
>> might need an alternate key derivation function: SP800-108.
> 
> Isn't that what have in smb2_key_derivation()?
> 
> metze
> 
> 

Thanks for pointing out that function. Yes, it seems to do the right 
thing (once I changed the algorithm from the hardcoded SHA256).

Regards,
Joseph

