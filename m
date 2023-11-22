Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AFB7F520A
	for <lists+samba-technical@lfdr.de>; Wed, 22 Nov 2023 22:05:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iZlJLN5D1FfzlxFIE44ODtMBnuIPaOBwGHC/+EEmmbM=; b=2M9QXwE5FNPrGFnyN4+oDh0/Ww
	DYXgrZJPl56d+LM6MBxhmkXvCQ/TtH6vxWBWRNKY0nLwcbw7Di8Aw8MMate4AdjQeeWH36bA4mKrE
	aXX6VOTUweDlEMHKmWcgojYVzp/w/X9eVSXZ9J8QUeRj/I9J225/5ph8bLVpblgL8flR/rzRGPaTt
	xFeywWS8AqR6WGGnkKXiudUQNAQ1AdGXsr5oh06tb8447s2gU3+W8qaEuIoNdXD7/QZtEphDdnvgV
	o7dqovNwLgBNs1Mwp8Q+xwrpoqxKiKj0DeGwOG9q5uXpdTudtuP3ylI3sZDK45trx6YxW5f6da8yU
	WwWCLClw==;
Received: from ip6-localhost ([::1]:63322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r5uPV-000DXV-Rm; Wed, 22 Nov 2023 21:05:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54498) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r5uPI-000DXM-Io
 for samba-technical@lists.samba.org; Wed, 22 Nov 2023 21:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=iZlJLN5D1FfzlxFIE44ODtMBnuIPaOBwGHC/+EEmmbM=; b=M39vOmiZSs3TmoYwsHlPDH1g4Y
 ea34r99sdVqJ8/gRY80qkn2It8r258yU1rhx7rUnV0mPvsR/rFGICRggX31lwONwZbT+een8IqG4y
 SujILaKd6vnFRaxiJcx8oZcA13R85G1Y7IpRmAnx7gF8/uZ7qJCiV1FnTrgP9O0KQEhXXV/WVgElD
 ukY88Dg6AGL7PH/SovkBusjUr6uWl3wvgzttO4XzOSnMADlq2gVd4CVXgnwYADvK+ZMIvQrPe1s9t
 DCcvbxG5dvImfp+2c3Lm7tVZctWzD1cG3BTy1MseVcMGpYXo95MyvdoGNSNiD+0zTFOdtURQMXgC5
 4Fi/WFhbfy7KE9DdswRzoRxzAndfVldW+Q2S0GHjac0TeeLSsgBBdR4/FA4QLSmlCqeUcQBu/7wF+
 liCqkyZImmnVhxvBDXAbkhwixitKlsXGeIv71WwrOqgABO3zOG4PI2hJuORY0wVtbOzRjXjwa1SkN
 GLiny8Feorsuv+ogjSzZSUq4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r5uPE-0004f7-19; Wed, 22 Nov 2023 21:05:09 +0000
Message-ID: <562781ab-14db-4858-be0c-d1dad20f852e@samba.org>
Date: Wed, 22 Nov 2023 22:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suggested crypto libs for Diffie-Hellman and Eliptic Curve
 Diffie-Hellman
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <81c7b2c93303aa93bc3b6747c7935e040afff238.camel@samba.org>
 <2320390.ElGaqSPkdT@magrathea>
 <107f4011e2de161a39d88a8c9698917b0e9dd75d.camel@samba.org>
In-Reply-To: <107f4011e2de161a39d88a8c9698917b0e9dd75d.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 22.11.23 um 21:26 schrieb Andrew Bartlett via samba-technical:
> On Wed, 2023-11-22 at 12:07 +0100, Andreas Schneider wrote:
>> On Thursday, 16 November 2023 07:08:59 CET Andrew Bartlett via samba-
>> technical
>> wrote:
>>> For Group Managed service accounts, which we are working on, for
>>> reasons around RODCs and a few other things, Microsoft has decided
>>> to
>>> internally use a key-agreement between a 'root key' and a 'service
>>> key', both held in AD.
>>>
>>> The password comes, as I understand it, from the key agreement
>>> derived
>>> out of a Diffie-Hellman or Eliptic Curve Diffie-Hellman exchanges.
>>>
>>> This is all in MS-GKDI, referenced from
>>> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/9cd2fc
>>>
>>> 5e-7305-4fb8-b233-2a60bc3eec68
>>>
>>> I just wanted to check if there are particularly cryptographic
>>> libraries we should consider for this work.
>>>
>>> In the past we have looked to libnettle when gnutls didn't provide
>>> the
>>> functions we wanted, but that was backed out fairly fast as another
>>> method was found (
>>> https://bugzilla.samba.org/show_bug.cgi?id=13276
>>>   0784
>>> 4a9a13506b4ca9181cfde05d9e4170208f88).
>>>
>>> Even so, for this case is libnettle still the best first place to
>>> look?
>>
>> If something is missing in GnuTLS you need, open tickets at GnuTLS.
>> They are
>> fairly quick implementing the stuff we need.
> 
> The main issue is the time to get the changes into the distributions so
> we can get them into master, but yes, it has been an awesome
> collaboration.
> 
>> They implemented all the features we needed for Samba so far.
>> Example:
>>
>> https://gitlab.com/gnutls/gnutls/-/merge_requests/1611/
>>
>>
>> Also AES-GMAC, AES-CCM, AES-CBF8 ...
>>
>> They also fixed performance issues we discovered ...
> 
> Thanks.  It looks like we won't need the DH stuff, thankfully, but we
> might need an alternate key derivation function: SP800-108.

Isn't that what have in smb2_key_derivation()?

metze


