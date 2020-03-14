Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA3185623
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 18:43:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nFMevFSeoXyqrnXKAwLU4cIbMc8lDa2KLEMxe+p1kk0=; b=0mjJLmlHaWrjrFDrQcXoVwPtL9
	LIsBa1OYxUB/ExbZ6Vb+Oy1Z1TWcrRgS5d45djGcNfz7s8VZeSj+UnxPZW2hMim6/SITCw4NGOSru
	Kue8G6zxPuYdvpVHoC0vaCDPfXAC6edLZJIpXYJW+ES1+h9SvOf6lYuZH6qU89uVXhrr/FyGpR3LE
	FqULlr4r97mGKwEZvJQ7gbzk1PxdHzWp486+f4u5OcAmbRmKl0R43HN6I4W5YhibRUSj79CM9T2Rr
	mdbts6eyPRlbozrqbtzyfupYxUof7QEQgKY9IeHOkOG6D/oi9Ic2E5VqXsrSCY7l9qcd2Xd/1Yhqu
	ktbC4Erg==;
Received: from ip6-localhost ([::1]:56498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDAnx-00G6gX-H2; Sat, 14 Mar 2020 17:42:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19586) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDAnn-00G6gQ-Rr
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 17:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=nFMevFSeoXyqrnXKAwLU4cIbMc8lDa2KLEMxe+p1kk0=; b=rMavi8QrApYQcp/HIF+1okiWrG
 AuOUcP53z6nb9EWlnFbyEKQXJqWmYZTp0lC7pUoQumDWn84aZpbsG/RSp/catwcSfmtcZJ3KoKZZK
 hJvRnSUZJiOW8IsnyyzdtMjv1uU+R4l9xgqA0Ix+6TOBhe5cJJdFildwnAYkzOcfUSLymuMTXcxPS
 sfxnoyip/o0VyWQE2CQtdkYkgXt70WgrAqcb5TeppH6NamxLbTbIJAtgrfH486/GH1eEEEwzLlk3N
 LPa9zrYtLkQjihYh95PKh+WXA+gwNmU63kh0p7d1LBjn0yc6XhSzOdfxSox+RJvMOmqzzyZtVLk3g
 16kxjKS6dw/q30jT2JCPoHRqk0PaC2xWWWb+OVDKYr14wPNel0ooNmv05Iu4L5+kwWouLylBMxfrY
 7KXr0oN1RDYNaYVnp6SmYM0QkFzgS85rhN6IcPIwSRZY8yrSHSYwKGQfxxE74knofFq7gRDVLti6n
 O9QyWFUMQF/gZXkEtqEKNIbK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDAnn-0001Ug-8F
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 17:42:23 +0000
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
 <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
 <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
 <2ee4998776b6d690b9f458cdfca7c11626e86784.camel@solinos.it>
 <1e12e848-3540-7651-8712-752600680296@samba.org>
 <0d5fc070b38d2ca948588126848613835255cc6d.camel@solinos.it>
Message-ID: <d4433de2-ceed-dc73-6440-1b8aebf21d49@samba.org>
Date: Sat, 14 Mar 2020 17:42:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0d5fc070b38d2ca948588126848613835255cc6d.camel@solinos.it>
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

On 14/03/2020 16:45, Dario Lesca via samba-technical wrote:
> Il giorno sab, 14/03/2020 alle 15.45 +0000, Rowland penny via samba-
> technical ha scritto:
>> Both ;-), the record should be added when you join a Samba DC,
> What you means exactly with "when you join a Samba DC"?
> "join a PC to a Samba DC" or "join a Samba DC to a ..."?
> I think the first is right
Yes, When you join a DC the A record is added by samba_dnsupdate, a PC's 
records can be added before the 'net ads join', by the join, or after.
>> Ahh, a Windows DC will not have samba_dnsupdate,
> Yes, it not have. But here I do not use a Windows DC, it's a Samba DC.
> The Windows are the client.
> Why you say "a Windows DC" ? what does it mean?
Just what it says, a DC running on Windows.
>> you will probably have
>> to create the records manually with samba-tool or ADUC
> Yes I have do that initially.
> But now the record it's gone, I have remove it and I have un-join and
> re-join the win10a pc and join the new win10b
I am a bit confused here, is it the Samba DC's dns records that are not 
getting created, or is it the Windows client records ?
>> You are using the Fedora packages to provision a DC,
> Yes I use the Fedora packages for test it.
Thanks for testing them, but be aware that there are major problems with 
the Fedora packages, that is why they are marked experimental.
>> it looks like you might just have found another reason not use them
>> for a DC ;-)
> No eventually, if so, I have found another reason to fill a bug on
> RedHat Bugzilla.
Possibly, but it is Samba's code and if it is a bug, you should report 
it to Samba, not Red Hat.
>
> Since you tell me it should do it, this is a bug
I am not entirely sure it is a bug, it may be, but further testing is 
required.

Rowland




