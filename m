Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF19FA7D6
	for <lists+samba-technical@lfdr.de>; Sun, 22 Dec 2024 20:52:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SKenyS7EAQtWOWPtb1I3FWjNdfzsbzxJB8YZkPuEuG0=; b=xpPtg5Pwg8G2AxJnbRfizhg6nL
	dCulOFnhAGOH0Szz0eqBSJyLt1CjCP6W0Zlbgd6d4Qr3mPk2qMwTZHBV0YjfXUZ84wTeaHspOVqFk
	0JexNL2a8QZQsvZlaLKPF94ve3FNgCeWx+9Sb4gdHhWHUxgMPGjSkI6hIPfUOaIuxP4m/k6NmxqjY
	1CPSHcCixODvgVzI7xMC6wR1eZshM+6aTfjQ0rL/CPuSqBUvfPFt0Wgct++B+IFkIo588Jjy9RHhm
	VPOE3WQHAQ4FqVZbyevr9K5x6HOjobipNQIuBLoFRtwSbDobSWSaXQCjcdFqRn68swoHszPF1czlq
	emzuW9Yw==;
Received: from ip6-localhost ([::1]:54302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tPRzb-004ke6-8t; Sun, 22 Dec 2024 19:51:59 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:57397) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tPRzU-004kdz-Vw
 for samba-technical@lists.samba.org; Sun, 22 Dec 2024 19:51:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-725ef0397aeso2780441b3a.2
 for <samba-technical@lists.samba.org>; Sun, 22 Dec 2024 11:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20230601.gappssmtp.com; s=20230601; t=1734897110;
 x=1735501910; darn=lists.samba.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SKenyS7EAQtWOWPtb1I3FWjNdfzsbzxJB8YZkPuEuG0=;
 b=avmGlOFYMeVBhyl2j82LKpIc8kxoN7BoQaRIvJ3XbefjdbJN4Zzn6WwNqf7CC81PLT
 jEx0Mv3YWFZYYYylq6MR8yTseK3LdZA39kvRSQdXcvKau1CGKe5iIEUTsOsJXyKJdK+Y
 JELtBKtBE89voQJxV/GR8T1DHwXy5aojhg/n24N/WlHOQb2R10LZC4gIf7xruxchpxp7
 5xexwfvuoqtDhvkoWLpNgY0QHMFVz6YD4vdtMyfGmOvtpo3pW2QIPz9HJ8Db3E7u9oKl
 MZImx5JTQGJVJdftUcygyaqM7Um4emQ6adQmRF71FZ84pJOAmRQtPFDvoIATFqvjI3YC
 R2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734897110; x=1735501910;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKenyS7EAQtWOWPtb1I3FWjNdfzsbzxJB8YZkPuEuG0=;
 b=IbZpn2XRZDCTnGn4vr2FelZ3zdLi01zWjnozi6Mxt2wD9ns444aMXWXwBUUDzUPs7w
 g0aIz/qcHl8MbqeBwqKJgK6D8mvPhgTM5jIMYkmjCuog3UkshuFBlyvb/KBoiZdi5Wjx
 B1rLjizgbBeRZnHZpAP6WyPd8OqoR7ZQ3DY3Yqj1sJ646zAVKLNc71PJpgxpaaYf2KOX
 h9o2mgVITrGMcjMpvbdAV7JRjM8H1D6N7Oh69tvPsNWmWhgHOa4gSmtkjyn6gvuwE6Qt
 OYnfE+jbecw4/YEOw9BRuxfAh9sX0aVtG3dwiRLqyrX3whcFKaltlYiQ47RWqPTyL+GS
 wOJA==
X-Gm-Message-State: AOJu0YxITcVsAPS++/4GMlEQ3DZ1PaBt/rSRZpmTHw7zDIwFmx9B4EOr
 lqK1ACKswckbaJ3aDn+LnNmB7LcdkDfCx2pC+Nhq6BQcT8puRPOL61U1g7pk1vs=
X-Gm-Gg: ASbGncso9UfHH/lz/iOaFaWTAIvHxha0SbWoPCOrMOdcmJ7A0+jDEp79CZMW4Sj8A6B
 ryveMCX+1n2TWmZ9GIfyg/7rJFsk/Vrrze9eyC1uCGWAaFLJVHudHEdNEou3C0tQU5hol9ZDnYK
 Fan8de4KvgeYDJ4QxDasjB58Gh3e2+dZKxxkJJBMSZLd5sBhfxfKVkflMlE7WUS8Ebo2zWrGhRJ
 PTRlaLJkrTCgwRC29HMMR7SkQlO4Ut2oeKBjJWZkHFXFjMCktSlzv5bnLgjLr8vxXwkN1D4ozJl
 /VDf+VWrorRYUdA1ygbhnoudUhfH
X-Google-Smtp-Source: AGHT+IF9MwobMhT1nEPfxZOGZ3JjHS3DFV4c++z3gF1z15zkyROE+7N0kzekFheCA8lZIXpqLtUQXg==
X-Received: by 2002:a05:6a00:21c2:b0:728:e9d1:218a with SMTP id
 d2e1a72fcca58-72abdeaaa3fmr14871877b3a.17.1734897109797; 
 Sun, 22 Dec 2024 11:51:49 -0800 (PST)
Received: from ?IPV6:2407:7000:96d8:f484:913:59c2:a63:6e42?
 ([2407:7000:96d8:f484:913:59c2:a63:6e42])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad90c1b1sm6695651b3a.185.2024.12.22.11.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Dec 2024 11:51:49 -0800 (PST)
Message-ID: <dae5a566-a8ed-4861-a68a-acd44deecb40@mattgrant.net.nz>
Date: Mon, 23 Dec 2024 08:51:43 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Open SSH kerberos auth not working with 4.21.x keytabs as server
 principals are in caps/mixed case - keytab breaks RFS 4120,
 section 6.2.1, fix for 4.21.3 please?
To: Ralph Boehme <slow@samba.org>, =?UTF-8?Q?Pavel_Filipensk=C3=BD?=
 <pfilipensky@samba.org>
References: <06ffa961-fc2f-4d22-9e47-e2c007e62b3e@mattgrant.net.nz>
 <e283dd4c-8fb9-4912-b5c9-2da171c92e1a@samba.org>
Content-Language: en-US
In-Reply-To: <e283dd4c-8fb9-4912-b5c9-2da171c92e1a@samba.org>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!


Thank you!


Ill keep you informed about how I'm doing with this patch.  I've got 
OpenSSH working with sync_spns setting using the patch, and sssd by 
creating a special  principal account_name machine keytab and setting 
ldap_krb5_keytab in sssd.conf


Regards,


Matt Grant

On 22/12/24 00:53, Ralph Boehme wrote:
> Hi Matt,
>
> thanks for bringing this up! Besides a behaviour change we'll also 
> need tests to cover this.
>
> @Pavel: iirc you've ween working on the keytab generation code 
> recently. Would you be able to look into this?
>
> Thanks!
> -slow
>
> On 12/21/24 8:03 AM, Matt Grant via samba-technical wrote:
>> Hi!
>>
>>
>> Any thoughts on including fix for Bug #15759 for 4.21.3 please? 'sync 
>> machine password to keytab' sync_spns is producing non functional key 
>> tabs - patch below to lower case default generated parts of service 
>> principal names in Unix keytabs
>>
>>
>> Its a major functionality breaker.
>>
>>
>> Thank you!
>>
>>
>> Matt Grant
>>
>>
>>
>>
>>
>

