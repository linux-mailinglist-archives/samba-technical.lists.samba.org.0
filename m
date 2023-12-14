Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F2812A93
	for <lists+samba-technical@lfdr.de>; Thu, 14 Dec 2023 09:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=a/FcJT74tpKsqL4cMftR/wqg/sAOHKU0yUNLRGl/6EM=; b=fhZhpKf8Fz2ZmiVxGJ5wqIE4lm
	60sfZ7Po4EcU1ZILc7y0gVMSuns87vFHaTfh5UZV+lG0roHHE1NPLcrhVHiHBmO68UuTeCb1DWq+9
	ag0Z07WbtT7B2ZpgPitfBlBU6Yhh6oX4yAPiREQwl9UxNiFHICSFx4ALbejYepxlzKRDpmYlfPJCC
	sQAUQ0NYl6nGmm2a2c0lba6IKXc6rVY5j2AxPY4Zg2/eZ/0qBS/p23aktQ7vRM9yfoTcXlENKmDL5
	DSZEI0EykQVAAVIqDIUFGJ+eeGSSwBTlRLueGqfV1K5bWRT0o5kQzZCAJr0eu9FXBoDYNXHbuh/D1
	BYSi1Rvg==;
Received: from ip6-localhost ([::1]:33856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rDhJ8-007CPY-Cs; Thu, 14 Dec 2023 08:43:02 +0000
Received: from mail.vulnscan.org ([2a01:7c8:fffb:b9::1]:44670) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rDhJ1-007CPN-Gq
 for samba-technical@lists.samba.org; Thu, 14 Dec 2023 08:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=vulnscan.org; s=1; h=In-Reply-To:From:References:To:Subject:MIME-Version:
 Date:Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iDi3i83NCm4hRq6xi6FAPARNyYEuzeSwBVG8H0HeFWk=; b=J4m2u+LIKqYSEtpblK0eWRbT2X
 +3cHXPpjBudOrCpOfwvFYJjcn10B4cyVieMuWvtidt9aglAW7/HoFughXJCXL9NgY2jKeZW4W76/s
 uu+im/XOZLh+yDz48Btm4PVA4xUi6ucMvvIWK36LqoAOvgeYp0bRH/EQu6H5Jf/ZRaOxsG9Jh+FRG
 wPHkAX/t4OYvw4GTe/40FIlM49M8yt88GTKJejNGxf+57DefuimwyLP6JmGEP94/zZeL4FF98oKGe
 MFNHUHpQnU+PrHum0epPGA3a1ftgsFGokXnr08IeUNxhrN/fc1goB+jbhXuloQAAqXHT0h8cu3klB
 tWwW+x/A==;
Message-ID: <8c842ea7-2d96-4607-8f12-2af6b0003acf@vulnscan.org>
Date: Thu, 14 Dec 2023 09:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is Samba AIO affected by recent Linux data corruption bug?
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <aee71586-ab0b-409d-a375-75fb7fd6b223@vulnscan.org>
 <80b5ed1715aadc11a1ce1cb025b7e53c4c7d6992.camel@samba.org>
In-Reply-To: <80b5ed1715aadc11a1ce1cb025b7e53c4c7d6992.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Bram Matthys via samba-technical <samba-technical@lists.samba.org>
Reply-To: Bram Matthys <syzop@vulnscan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

On 14/12/2023 09.38, Andrew Bartlett wrote:
> On Thu, 2023-12-14 at 08:38 +0100, Bram Matthys via samba-technical wrote:
>> Hi everyone,
>> In relation to the recent Linux filesystem corruption bug with O_DIRECT
>> [1]. I read that to trigger this, an application needs to use O_DIRECT
>> and that the bug is that the file position is not updated properly. So
>> the bug does not happen with pwrite(), or if lseek() is always called prior.
> No, Samba does not use O_DIRECT (and it would be a lot of work to make it do so, I investigated this once!) in the file server.
> An incredibly rarely used client tool, cifsdd, uses it optionally with --direct

Great, glad to hear that! Thanks a lot for the quick reply!

Best regards,

Bram
