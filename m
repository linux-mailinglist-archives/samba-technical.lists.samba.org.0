Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C65F35A1
	for <lists+samba-technical@lfdr.de>; Mon,  3 Oct 2022 20:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2b9g/BFbhPI0GBzwr+NMEAI6XpVHYCfGhG+LTaegFIM=; b=mHMku3JkE9kFai3NMMXJRF0cBg
	RzTM32+CvWpmQtbTc5FwSdK0mgFm3g3i/0rJyi7YvKtfUUoimtMl6HoYqlnkgLO7WypxtEWyyjX5w
	XUvnGvh5hBeaaccHMngWHR1knUmkIpY68xfkxAk2ysN7HJS09mBlFayLwkEyEuJnOVSi42AaxuPC2
	tO9WNf17yCeUL6f1lVsQKTZnjArfMMvvPVMrhEFEmX7qfZ2gUSfEMo5T4KDgXiGNcY7iMpAT42vlq
	HcDNsHcAX3bBNWW/pAlv9g+ae7Pc1sASfFxwzhc6ORs54e/uOHllY4HT/PttS66rY+/60/hovW2D/
	bG+UiYVg==;
Received: from ip6-localhost ([::1]:56740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofQBz-007ajU-PK; Mon, 03 Oct 2022 18:29:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofQBv-007ajL-L9
 for samba-technical@lists.samba.org; Mon, 03 Oct 2022 18:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2b9g/BFbhPI0GBzwr+NMEAI6XpVHYCfGhG+LTaegFIM=; b=ejkWie0OU8RIZAViGTd/nvddLX
 zpTdM2bvocIjg2jjAmyIVWzmr5oO0e/7+Jt9SXiu3BQpzYOPRVcv3O8FYxvpO+hWmipbFzyWV0ZB3
 3PVTNJDikY5Im37obLNhj8agz9Kx/+/6irgXZtnUSDVJusGUT60KjW9xH17eY+gl8qg+eL1sbpail
 vkSng6rgMFoveigxCV0GqwwPv3pQPSXRmuLscV1LXywL08Te3uNhn1OVm7ITJgHUpi0DKlawYE/KS
 G/yySAoTBJ+9m5CTRt5zo5cJpDT7XuexfqCp8Naz0+XLYWFqSHDaa2XMvski52e7GGbY0Gs18q6O8
 ps1WhINCCH4vkGNXJr5EHxJDmyspa7WicM7jRnYbqm5uJhmDiLcLMQ+XZ7YzC+TMOzFv9o6EeEMiC
 IdAO110MG7haqxxDbM3qSaY/JdvSc5RDi9fnnSqejsm5YquXhhYNVfeeJo7KvDXzTHJU8Jk6YCJ0s
 /sScgBOMky9tolaxVWbV3IB6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ofQBu-002rZT-1U; Mon, 03 Oct 2022 18:29:22 +0000
Date: Mon, 3 Oct 2022 11:29:17 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Message-ID: <Yzsp/U5itUs486Ic@jeremy-acer>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Daniel Kobras <kobras@puzzle-itc.de>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 29, 2022 at 02:17:57PM +0200, Ralph Boehme wrote:
>On 9/27/22 13:10, Daniel Kobras via samba-technical wrote:
>>The issues can be avoided with a consistent mapping between Windows EAs
>>and the 'user' namespace in both directions, ie. no longer present EAs
>>outside of 'user' as Windows EAs in SMB_INFO_QUERY_ALL_EAS and friends.
>>Do you agree with this approach? Are there applications that rely on
>>the current mapping of non-user EAs? Please let me know if I should
>>submit the patch as a proper MR.
>before jumping to action can we also please briefly consider the Linux 
>kernel mount case with SMB3 Unix Extensions and mount over SMB?
>
>The proposed approach makes sense for Windows clients, maybe be should 
>incorporate exposing the raw namespace when UNIX extensions are 
>negotiated. In the end this is likely going to be a made via a later 
>MR in the future, but I'd like to see both cases considered now that 
>we're making changes.

The SMB3 Unix Extensions can be fixed later via a new MR.

The behavior for SMB3 Unix Extensions should be that GetEA/SetEA
calls on a SMB3 Unix Extensions file handle should not hide the
namespace from the client. From my experiments as root on Linux,
the ListEA call only ever returns names from the user. namespace
but it probably won't hust to just return the full namespace+name
for a ListEA on a SMB3 Unix Extensions file handle.

The nice thing about this is that it means that we can
cope with case-sensitive EA's - but only on a SMB3 Unix Extensions
file handle.

IMHO this fix is good for now for the only existing case of
Windows handles, and we can fix SMB3 Unix Extensions up later.

