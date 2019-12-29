Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6187D12CAF3
	for <lists+samba-technical@lfdr.de>; Sun, 29 Dec 2019 22:15:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HMhTl81OqynJeFWJFqm0QInMyh5RtHXhuavGtcHPHGk=; b=HnHthCqcTBY8Yi2IrUi28YxVVi
	rQcfGMlvyNFN/OKP3R5NpSkUbLxXyQISVxXOCv/zPfjaxdQsRg9WzOT2F1IhP3afDN4PstSGvXZCu
	22tSNH6YkH5Nr1ooQ7HrpYtNGu9wcOlo9MUFSI8kV6pyzLM9bmkdyMgiDXh8by0aIEQTPBPEk1a7Q
	SDbRBo5aNjiUWN8xsFUGectYQ+AXY8QFztulpaQCXkUzuUJWxCo/loeoNf0IrVzdC5Yi+YXZ3tDxd
	ZdG4bxM/qjAJRi3NmsBZqg4889vu4xWyL5SYuALV69KCHAzhcTo/PkdZgJ5jXb6b15e7FA3JrlmbV
	vC9UYsIA==;
Received: from localhost ([::1]:31040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ilftx-000NOS-Qr; Sun, 29 Dec 2019 21:15:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26666) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ilfts-000NOI-W6
 for samba-technical@lists.samba.org; Sun, 29 Dec 2019 21:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=HMhTl81OqynJeFWJFqm0QInMyh5RtHXhuavGtcHPHGk=; b=udo4ZyTcExgkcQqCs59KtP3buf
 wn7xkoAkJzukN2AD3Tby2iGX9AXlDOz6RiMbeLapkDNgzAwpz5alFR9I1Z7c3hrVacuM2Je5dSOjd
 qZtcOOgKwHXaeP2ftO6RjR/fkjNZHZxOA5omGwvuJ4fsRQc8evEOc0VTaCbXQkkkVy6PeTMlMCaSd
 3qyA6TGx3rz6hkjEWoVyrxImaGX9Hi1q4aLr1XBpRCaosAYXbRfOCLdZhnMadDMjse+8IWQGgnKzG
 jE2AnJW1AEuCUnr9EBPBc6+mZBy5XhF13+IOKwM3uM1HYauLLYiyVnqpXgPHvFwwveiJHs3y+Soyy
 /NYL06r/9g1CTgVvIEb75ylOuHxjzJdeeY64uvjRaaBVjPm2QcUHyYodQupopmM1shaxYUiXKR4Vx
 zFnF0bLHWzKsSK9FWcvGqwd0Zjelc72hYbBoh0Jgnsb/LUWLjIWkFCp1MP66oaCDYsXW2rBTXRb9q
 sYCPnTqSKtACEgnLKd9bkO0G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ilfts-0007Lg-Iu
 for samba-technical@lists.samba.org; Sun, 29 Dec 2019 21:15:00 +0000
Subject: Re: [Release Planning 4.12] Samba 4.12.0rc1
To: samba-technical@lists.samba.org
References: <cb8a8065-cd6b-cfc1-8de8-c156eec9895c@samba.org>
 <34f5bab7-32b6-198e-65d8-ccc59d67fdd1@rosalinux.ru>
Message-ID: <6c7177bb-efb9-a8ca-f1bd-d62a7ffc00b4@samba.org>
Date: Sun, 29 Dec 2019 21:15:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <34f5bab7-32b6-198e-65d8-ccc59d67fdd1@rosalinux.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/12/2019 20:48, Mikhail Novosyolov via samba-technical wrote:
> 19.12.2019 14:35, Karolin Seeger via samba-technical пишет:
>> Hi,
>>
>> Samba 4.12.0rc1 is scheduled for Tuesday, January 21 2020.
>>
>> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
>> has been updated accordingly.
>>
>> Please make sure that important changes end up in the release notes as
>> soon as possible.
> I have not found where release notes are, I wanted to say that https://gitlab.com/samba-team/samba/merge_requests/961 can be described not as "Add support for anonymous connections which smbspool", but something like "smbspool_krb5_wrapper can now be used as default CUPS smb backend for both kerberized and not kerberized printing via smb" to make the original intention of that change and its practical usage clearer than titles of commits.
>
See 'WHATSNEW.txt', you will need to provide a patch to this.

Rowland



