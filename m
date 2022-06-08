Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5C543BAD
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jun 2022 20:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=u41he1mGEp00Y4ZcymYqpBXCizjvRu/K/i8gZ8+/+uQ=; b=IjECNdEoxXb8EBIuolFRdU0doC
	vD88yBsggukpX4LtjGE4ZAolp5tbJPmsU334P+K/g9/UvPiALEdd/beBthaWx5t6x+8qpxEP42zKY
	rdUKwr5VXANIxGLwu0tYoYCBVpGYMaj0yLWovhGaiA1DXLK/X+bhHyP2YRQqaJ3vvEdNnWk0wMrks
	EIwN8JgjY/LSiNy6CFS8aAMM6lYgXMRZ/2f53Px83vMgv9ugL4RG4mUb0ggZAhpTqE8dg3QlAuLKa
	iqwPjAGDkrl3z/FdhwUr4cdY/ATrZXbnyWOM2EcX19BaMdRFBEM4deocQyVk5zmnmqje2ypk9sYIL
	LuMF+nwg==;
Received: from ip6-localhost ([::1]:18366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nz0fj-008QSZ-NW; Wed, 08 Jun 2022 18:44:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62166) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nz0ff-008QSP-1q
 for samba-technical@lists.samba.org; Wed, 08 Jun 2022 18:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=u41he1mGEp00Y4ZcymYqpBXCizjvRu/K/i8gZ8+/+uQ=; b=Utnltv+SfpaVQoMQiPBZMbTzIK
 NkfLJIldfM0kf5KI8pM2m0GmfSBZukwFMX/92o5quXRMaOwTqkpI3FNbldOlhBiX48yxP2hhVoBmQ
 4i+6QrKBM45KjR7N2RHtj+ydkpY8KvPWZlWyeE/d1LJaG1bsSRBEt6NvyzI5nHlmvVn85JJBcTtL8
 RQM/8SGGaQk4Y9JkCztdLuiZ6qqCMIVSm8Wm6o0BwhNrJjknki24f7xpS+bsbrfNBplGKSwSQ+ta5
 kQ6i3Viy39Jg2Y7rfKBNA4GiZhro8neiXRVgEWf1LWW/dsI8mX2vI0UKIdDRPD85a5nAitonb9vGr
 3YotYMVt4d2KrkC9KVJI13B3Zlt0oossQWWzEkF6aqoi151YUv3MDjXt34pLS/k9UbhCwGGUkf72x
 EKyDCrRBeKJWQFOmL5s7Rklhr0r1TuEbdF5d7Tny89ZaUIe+ajIYWnQ1LI2rtncqn1LscMVdzoVoi
 0nszOYVGXWj4vkgq5pAqNQxT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nz0fc-004chK-Op; Wed, 08 Jun 2022 18:44:44 +0000
Message-ID: <73759a92-13f9-1a92-06d1-42d24873ff42@samba.org>
Date: Wed, 8 Jun 2022 21:44:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: More Podman work needed
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
 <1737413.VLH7GnMWUR@magrathea>
 <2f5a0903-d3bd-8833-6e3d-da3540124c2f@samba.org>
 <1924935.usQuhbGJ8B@magrathea>
 <4f5b548b-ee32-cd2c-6359-de61f0d7f15f@samba.org>
In-Reply-To: <4f5b548b-ee32-cd2c-6359-de61f0d7f15f@samba.org>
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/8/22 21:30, Uri Simchoni wrote:
> On 6/8/22 19:22, Andreas Schneider wrote:
>>
>> Maybe the rpmkey package is missing for the repo. Which repo was it?
>>
> CentOS Stream 9 - BaseOS
>                                                               1.6 MB/s | 
> 1.6 kB     00:00
> Importing GPG key 0x8483C65D:
>   Userid     : "CentOS (CentOS Official Signing Key) <security@centos.org>"
>   Fingerprint: 99DB 70FA E1D7 CE22 7FB6 4882 05B5 55B3 8483 C65D
>   From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
> Key imported successfully
Correction - the key was there prior to installation of additional 
packages, so all is well, sorry for the noise.

