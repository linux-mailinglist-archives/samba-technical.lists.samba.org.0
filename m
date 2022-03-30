Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D93C4EBBF4
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 09:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3miyIrlTCsM2raTK49KOht9R7hMOWTic4ouCC35PZ7g=; b=HSDgATABmJ9oSvWKiX2R0GiSnP
	UK0K7tU/heU+1R+dm6w430AJ7d+hyP2rJHIzy34CSp5TxA2TeRQ6gNKcEK/l2Yn4SZNtLRT6IH9AC
	lZMDDwTaCz5X4n8+3lNinW/9QRf/txcyXuFYjEXU/8Gxwo5kKfbyrSeKUyMgLIwdp8C0RYbS082T3
	YqL7fKlMnVltI3D3b4Uud4joXuky9vxW4uwBRjjcicHZgUHCAtT7luWdHkGF9J9wYZqIQbqOsbaXW
	aWh+kCfLMByIgDmLV6nigxLNWOhbDsT+6vnMA4WntjzsW3oXjFQS8e21kUn+sxvyYf2o2iUgr+Ylf
	RLh/wCZw==;
Received: from ip6-localhost ([::1]:39082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZSxY-006hEY-4i; Wed, 30 Mar 2022 07:41:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZSxO-006hEP-HH
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 07:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=3miyIrlTCsM2raTK49KOht9R7hMOWTic4ouCC35PZ7g=; b=MMYsVrcaZts8JuY9AfctmRsHvx
 XygS1xNc0lSrCCa6UiHJDhKeXg3BTkd6BHDDyx4Tkx6Bh2uyT8vxOO16FUgSmbcQ4fy34dnnqwmH6
 b4kM/5u4SXRDNLQEAO1izHE2hUBXjDa/HMlzkyQjG5oh476DdgGYCjVa4qPN4vqHmUusWwkk8306v
 XvyILYh62kdkIYiiKPHryEl4s1ttzU6+iJelLs/4WZBqK6whtHRV5c5IfDX7lEc3gLL/iF2PxQnG2
 y3el/ddOTaMyur1Tl/UfVt/Egks1XPdxp4IJK3WkEIgeLy3UpRnPZukzpj3OrcdwVBVWyia2cnyjY
 ZYUmOvk6OAVu1W8qd9J5IPpX11vPwDQfhdqx4bgg9CT2jKkuB/R+6Zd5HnvKpVK0BmwV0GZjljaKJ
 PwRxhIXu15w6Wz0wEZr+ji1kLq2gyhaOOSAUklI9q+ak24wvNSbW61A9eaMPQarS17lsQ+P2ZpNW6
 PpDqGFQy9L0wMm30aU2fdcro;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZSxM-004Lsf-Vz; Wed, 30 Mar 2022 07:41:29 +0000
Message-ID: <70a0f26e-0d6a-ff5e-b638-343d1ea090e0@samba.org>
Date: Wed, 30 Mar 2022 01:41:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Regarding Mac os behaviour in samba domain
Content-Language: en-US
To: Prince Chaudhary <chaudharyprince64@gmail.com>
References: <CAM61p33mA2Oc7v_+iQj8-uuowyJJh2WTfbLGWQHUxiZdAmbLcg@mail.gmail.com>
 <6b999085-4639-ec62-0026-e99d26c5d6f6@samba.org>
 <CAM61p315WDPO0ZKzw2s4z7VPyJw5fV+9pgsesTmLjgo1uBT3tA@mail.gmail.com>
In-Reply-To: <CAM61p315WDPO0ZKzw2s4z7VPyJw5fV+9pgsesTmLjgo1uBT3tA@mail.gmail.com>
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/29/22 7:46 PM, Prince Chaudhary wrote:
> Hi,
> Thanks for your reply, i have checked this issue on apple forums but 
> there is no exact solution on it.
> 

IIRC, Apple's domain join capabilities are a proprietary solution, so 
probably no one on the Samba team is going to know much about it. Your 
best bet will be opening a support ticket with Apple.

-- 
*David Mulder*
Labs Software Engineer, Samba
SUSE
1221 Valley Grove Way
Pleasant Grove, UT 84062

dmulder@suse.com
http://www.suse.com

