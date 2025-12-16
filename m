Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B60CC1B3F
	for <lists+samba-technical@lfdr.de>; Tue, 16 Dec 2025 10:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=dfOOJLik1iN5ke4aD24Bt1v6/eLrk83U2WDg/Be9PqU=; b=zvlxChBXLslv5OharTUc7/0Td4
	bcLSqTmz7T4gZVL8WahXsd/gt0O6wGPeRPqu8N+I1oD/wulsEgBeJbug3B1OGmTyQNcBIARIPEc8u
	Lr1Xi2PJGqD8y5HfWhlnqBJxK8G00qVJ8OMsSbC2T3j4oxhrc7pjKHymN2WpKjBWzl+3bNQfut81H
	sg60qrjWxiMykePDFGszb5zLRGdfC2TjS+lm2P5J84WJtkVyqO76TAbow2EC8ASPzyYezwHfNBFNC
	7u/pM5UXoDXCv0JDsxG/GccFeLIrXLf8S4QIu2f9ile9C1SUvSBdSE74lov8om5M1nkXiO6aip5Tv
	POIbLkwQ==;
Received: from ip6-localhost ([::1]:39748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vVR7r-00GKSe-Na; Tue, 16 Dec 2025 09:13:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14736) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vVR7n-00GKSX-FD
 for samba-technical@lists.samba.org; Tue, 16 Dec 2025 09:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=dfOOJLik1iN5ke4aD24Bt1v6/eLrk83U2WDg/Be9PqU=; b=DZnB8ie+AkLKja+EVDU1CU9ePv
 CE1CUhrELXrPP/UvHoRBsTCaY3CgWoH4yURlglINKI4IHCYxlJOeFDostxEI6SSk6gXW7IZnKoIoz
 phdIIh5Bxgnv0GgpxFuVPOU6DX0hP+DEc5MUsIo5kiamz9kg8xLozmFTnyUVOUyYmzIcOkQ+yPC+k
 ESWNS72AwQ1CUf3vIKxoYrQXbOMWcdSE+uis37Jt87jJUeMmZM0Zw2YG2QzYZ/TkEv18Z7dssyKem
 WAfdHnPq91/9RcoGLQYpTYJhoSCec/QW4Tjzeoi0MJ0/ardfdtJV/gnZI8m3OO/MRjRUevX8Gy82z
 Z0QS6uyrUeAEnIjDXa+ZdKkRDXQkjWP4lEW4Tcfo5RXVc4GK17dhlDlSJBD6O4v0vm2ZQAp1g+HcE
 kUjc+HpQz+8e3R3gDt37Q0ct1AVfGu0m57X1DITRKYGwuQN0HX0XNYr9h4Ai8k1wp5TG2bFXC39On
 7NY5vMZtlfrza7+mCRtlRGx2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vVR7m-000ssc-28; Tue, 16 Dec 2025 09:13:42 +0000
Message-ID: <e4a4ce77-7ffd-45e9-9471-49e06edae524@samba.org>
Date: Tue, 16 Dec 2025 10:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PAC group membership vs tokenGroupsGlobalAndUniversal assumptions
To: sapir kvetny <sapirkb123@gmail.com>, samba-technical@lists.samba.org
References: <CAFPTsJ5JNO4TRgp5PCEravhxmMNSJnHJ9SyRaOUN9Y-2Dzg0dA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFPTsJ5JNO4TRgp5PCEravhxmMNSJnHJ9SyRaOUN9Y-2Dzg0dA@mail.gmail.com>
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

Hi sapir,

> While reviewing recent Microsoft documentation, I noticed that references
> suggesting an equivalence between the LDAP attribute
> tokenGroupsGlobalAndUniversal and the group membership embedded in Kerberos
> PACs appear to have been removed or softened.
> 
>  From an interoperability with Active Directory perspective, I wanted to ask:
> Is it considered safe to assume that the group SIDs included in the PAC
> correspond to the same effective group set as tokenGroupsGlobalAndUniversal,
> or should these be treated as related but not guaranteed to be identical?

I'd say they are related but not guaranteed to be identical.

The PAC was the SIDS out of the perspective of the receiving
service, so resource groups are added and the result is
also correct when the user and service belong to a different
domain or more complex a different forest.

I think tokenGroupsGlobalAndUniversal is more or less
the same in the PAC of the initial TGT the KDC of the
user generates, but that PAC is only visible to
the KDCs of the users domain.

Various trust boundaries add or filter SIDs on the way
to the final service ticket and then the accepting
service also evaluates local group memberships.

I hope that helps...
metze


