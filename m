Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810924B175
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 10:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5VjCv5XyQICZMRK0gS7kH7lAbDbh+5CcoWr3Ct36xbM=; b=n0jbMfL5HcRFnbZ5icx93HyD5I
	NlMx2r8POyB070Uom0OyLRSxtJ42J/FqX2CkNrs30WED0VsKCk6NvItSe74+z8KGXoQTFPb3U6UlL
	jnLczO8QEkParF5H181wMvwuHIMQylfF90qZ2RqxzT4sXzOW7oYBecXbKnN/NbKsMWNscfHqpYjbO
	+hTEI76GArLPFllyPGJAE+825KtRSKcM3BCL3xeNHlIyrq70Pmkmc+hAzDuoHkGnWvPI+8SWETRpQ
	Hc+DvNin45B1rem51QgTwT932C+bYz/CmSD7MQJLtlA/F3PB332D7QH4A9Vr+tCGziZ2IFFg/7vW7
	L/xUr+rw==;
Received: from localhost ([::1]:19884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8gJg-00EOfJ-J1; Thu, 20 Aug 2020 08:53:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48884) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8gJa-00EOfC-8e
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 08:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=5VjCv5XyQICZMRK0gS7kH7lAbDbh+5CcoWr3Ct36xbM=; b=dzC7XNhkKhEb9zbBw9CN/W6VsY
 vWNTaGsAIQRTclVcthImvgeH9xgLbHfLXHg4GzdBikCsZOkThRCq38rmZ8vOZQRjcDZtu+oin1JTY
 m0WYmYNe7itq4oUdzXhHyO0Q/KHMw/Kk/txNgsVLH6lz6ZT/wSgbhumbr1oiFOEOfVCQQX+A8VxGe
 K0dEuUe9jW5LJjsCRGb0UTnGoK/v0mnC9GDv0guNm6UVVpy05T0rEZN+msLIeU7JTuV0KMp36iTO3
 m6e0e3WkvhqyGj/roNdE5p3mnGy2hwDnnc5LFuecNbxkQzR3ApsKeob0eMQyXWdhuBsB7YLXO6mF1
 r2HX1bVhbywcyXb9LJ7LgRHvEkJE2egSDGA5twTG5UQ0kD96TTU39CqX/g6zhr/7HPDpHOiO/vV3w
 Xq7J2WNZDS8jqlUe7DkAAc0Lzq+nhIwwSo9A9z6qgyZYve8tZsECFmvGzm9lJWd59hW7iG4MQKQRe
 19d3sEPl+XxvmeOzfxYSYkaK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8gJZ-0002fk-Qv
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 08:52:53 +0000
Subject: Re: Problem with login win10
To: samba-technical@lists.samba.org
References: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAAP5o6qqs81QbZAef/IH8MpAQAAAAA=@prawda.net.pl>
Message-ID: <4b881fe0-fc5a-bcb4-ba6f-279197933871@samba.org>
Date: Thu, 20 Aug 2020 09:52:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAAP5o6qqs81QbZAef/IH8MpAQAAAAA=@prawda.net.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

On 20/08/2020 09:41, GC via samba-technical wrote:
> Hi
>
> I have problem with login in computer with win10. Sometimes when I try login
> I get communicate the password entered is incorrect, in samba logs no
> errors. I must restart computer and then I can login.
>
> Sometimes login to computer work and block comuter (win+l), when try
> unblock computer i see communicat - the password entered is incorrect.
>
> My samba AD is in version 4.12.6. Users and computer I add in samba ver. 4.8
> and last I update it to 4.12.6 and then I see this problems.
>
> Please help me
>
> BR
>
> GC

Hello, samba-technical is really meant for the discussion on the 
internals of Samba, the code. Your problem possibly has something to do 
with the code, but it is more likely to be a miss-configuration 
somewhere. This means that you should ask this question on the Samba 
mailing list instead.

If you are not registered for the Samba mailing list, can I suggest you 
go here:

https://lists.samba.org/mailman/listinfo/samba

and register, then repost to the samba list ;-)

Rowland



