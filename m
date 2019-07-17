Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A016B5A6
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jul 2019 06:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=RehLJ1ftUyWQLnrlRrQTbDACzYX8EISWrwKB6hlp1ew=; b=H43eBPw1LYrDrRfdwtdQTW7VN0
	gEsNDNj8Fk42bvkCO6K1OaVsw1+0MeVo3ODPzWOgJlw4Jbpqa2fBwf6oUNH7mGTImeNHB/4yezQTE
	JR8Py/7RLDCYojkvVoUFc/uFElMvvHT4BYL8Vt1sZ6hnrOYcrlMxeeozyS5p5hTfziPJpaHCWCLo4
	AXP7VgSzH3qfOOfynUdvIWdy+6XSDStRvEggglXtBBMgQcGvrW8bxPARG8Hi5y39nlr3mTlX6XsaA
	3SeAjGBdiId3n1s7yIP+FnIlPWP+hZc66XO+uQ8TNefqmAKPGA+R05YHusBdY3L8zChGEPW46urRz
	UqpR3UAQ==;
Received: from localhost ([::1]:60020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hnbu0-000NZW-6u; Wed, 17 Jul 2019 04:50:52 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:48282) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hnbts-000NZP-LO
 for samba-technical@lists.samba.org; Wed, 17 Jul 2019 04:50:49 +0000
Received: from [IPv6:2404:130:0:1000:8c67:cafa:5be7:dd9a] (unknown
 [IPv6:2404:130:0:1000:8c67:cafa:5be7:dd9a])
 (Authenticated sender: garming@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 53E7F81265; 
 Wed, 17 Jul 2019 16:50:35 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1563339035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=RehLJ1ftUyWQLnrlRrQTbDACzYX8EISWrwKB6hlp1ew=;
 b=nBuZnCSS3UNuBvrD/tiyLZOPzZQH0sWNn3t0hITqW0euyVMJn3FRvWKOt3GbGYgobP0ct9
 c2zw4ajgxYW6tWLPnnzCCyCXcQS753NmguiXFu76RYu3uTKVCa3OOffJCOOEj7tq+KBvD+
 CegjEzeapfTF/4qPptb2zBIEAHoV45I1/qgn5pjKHAcu3Eg8GAI9HveNNSUGXeC4jCO1EW
 Kjo9dLFZeCHn8qVlzqwp5Xo7nvjjUY74MbWKLGzjc+H4ua0wdqIz9PyVdMzqi050CQRnlj
 1xxKNzAlpxzVFQW4mgLEaTia7aUiByZ9FRe1pk224wlSjZWWb6zXvWO9Sj4LMw==
Subject: Re: [Announce] Samba 4.11.0rc1 Available for Download
To: Harry Duncan <usr.src.linux@gmail.com>, samba-technical@lists.samba.org
References: <CAHAPYVC2dN5H=CzeL09mjWneg7CRDQ+vR3nhtEmK2asSKd_P2A@mail.gmail.com>
Openpgp: preference=signencrypt
Message-ID: <ee915cbc-60ab-a8b7-c24d-ac62a334d95e@catalyst.net.nz>
Date: Wed, 17 Jul 2019 16:50:34 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHAPYVC2dN5H=CzeL09mjWneg7CRDQ+vR3nhtEmK2asSKd_P2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1563339036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=RehLJ1ftUyWQLnrlRrQTbDACzYX8EISWrwKB6hlp1ew=;
 b=TKapRJ9rYDk6Qlo+KKEb7138K1gsQdoeLnB54ftizHwVovw1sUN3LG/4vfnOR/hOOxWlov
 9IcAmxFFXD4Z8mDrFuwpmhE87jXCqyVuimNrwl2gfnksI2Q3tPewWtL2RbDt+kyA439yvr
 NjUdyKpbUvxmBkQjIxtlPLbiObLcnjNnIBninUH5m8964RIa/C0zb/wKhQp6eQ5TaIzgFe
 1+MxbX41ZpgxuAAUCU/9JCmNEzz040W49kXCnONyYFFFJ/pAnuVFVooMMNo5M/uQE7n06W
 UkaidKgQ2xxOdvOC6GY3Hkrwh1pFAhpUTMT8q24I+eiDofTIZ0XyctZ7LsvodA==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1563339036; a=rsa-sha256;
 cv=none;
 b=oYCvPDZ8EoIRG1p0CHVGI40lz3jbCOVIDbvSjVY9JEYAT9VLgaSQpGX+lWTZWJyFrrpmyA
 Q6MJt9Vjc503HDRvIlCEVctvpKTjBZcyvRiKz7giDHrzI8wJ9Mqn2qD3jI56SITsBptXn9
 +yba4d6TfqyQg+Zh/wMgNKuvp31Z/S0x4zxPH4jrW3FQKivQ4ZAxP+MSX0XV9SHTBsIUdo
 k5vuFFkWok0HwYMvHlhP15hg0RRtKmMluQv8yRsREvFcyokLh423MH7SR1xZIZIce2IEIy
 kB8RLOwOwAV5mMFiv/mPtRE8h2COYMJh7jqZ/moJ7+puqnSqVVlslzqPI5vDRQ==
ARC-Authentication-Results: i=1; cat-porwal-prod-mail1.catalyst.net.nz;
 auth=pass smtp.auth=garming@catalyst.net.nz
 smtp.mailfrom=garming@catalyst.net.nz
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
From: Garming Sam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Garming Sam <garming@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I've been spending some time untangling what it actually means to be
compatible with 2012 R2. I've been writing a wiki page this week because
there is hardly any information about this:

https://wiki.samba.org/index.php?title=Windows_2012_Server_compatibility

I'm still working on adding some more detail, but I should be done in
the next few days. 

Really one of the complications in saying what we're compatible with is
certain features which we do or do not implement. From an AD perspective
in terms of functional level, we're about 2008 R2, but there's still
things we're missing from that like managed service accounts (MSA),
recycling bin, trusts, DFSR etc. Functional levels in MS-AD are normally
in lock-step and version the entire directory, so we're basically our
own thing.

In terms of FSMO roles, I expect we handle the RID master role
adequately, the schema master to a reasonable extent and likely most
2008 R2 (functional level) relevant parts for the PDC. As long as the
domain is at 2008 R2 functional level, it shouldn't matter what versions
of Windows are interacting with it. However, partition creation in Samba
for domain naming master doesn't work properly and so there shouldn't be
any code for that and infrastructure master concerns multi-domain
forests which we have only partial support for (and we haven't sorted
out recycling bin which also appears affected). Leaving these roles to
Samba even on a 2008 R2-only domain, with trusts, is unlikely to work as
expected.

Joining a 2012 R2 Windows DC to Samba without too much hassle is now
supposed to work for the first time (although I just found a new
regression, see https://bugzilla.samba.org/show_bug.cgi?id=14029).
Although we've updated the schema version defaults, we haven't updated
the preparation version defaults which are also still required (and
still needs more testing at this point).

Cheers,

Garming

On 16/07/19 9:38 AM, Harry Duncan via samba-technical wrote:
> On Tue Jul  9 10:20:44 UTC 2019, Karolin Seeger wrote:
>> Release Announcements
>> =====================
>>
>> This is the first release candidate of Samba 4.11.  This is *not*
>> intended for production environments and is designed for testing
>> purposes only.  Please report any defects via the Samba bug reporting
>> system at https://bugzilla.samba.org/.
>>
>> Samba 4.11 will be the next version of the Samba suite.
> <snip>
>
>> Default schema updated to 2012_R2
>> ---------------------------------
>>
>> Default AD schema changed from 2008_R2 to 2012_R2.  2012_R2 functional level
>> is not yet available.  Older schemas can be used by provisioning with the
>> '--base-schema' argument.  Existing installations can be updated with the
>> samba-tool command "domain schemaupgrade".
>>
>> Samba's replication code has also been improved to handle replication
>> with the 2012 schema (the core of this replication fix has also been
>> backported to 4.9.11 and will be in a 4.10.x release).
> I would like to dedicate some resources to testing this, would I be
> right in saying that because only the schema is supported and not the
> functional level, that I should be able to put a windows 2012 R2
> server as a domain controller with the schema master FSMO role, that I
> can add Samba 4.11.0rc1 to that domain and have it function with its
> reduced subset for rudimentary functions that are already supported?
>
> If so, are there any FSMO roles that Samba can hold, like domain
> naming, or must all the roles be mastered by a windows host?
>
> Any particular features you would like us to test in tandem with the
> funciionality that we will be testing for our future use when this is
> production released?
>
> Thanks,
>
> Harry.
>

