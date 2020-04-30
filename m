Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C221BF5C8
	for <lists+samba-technical@lfdr.de>; Thu, 30 Apr 2020 12:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1tPmnwVEPChdky1Urbw8hQ8MFxx5qnBk1elSJ7y20o4=; b=yVtEpLqUzW2C9QpncZkjruYH0k
	brHDyN6M7dZKvSoXk2ldofMbNbMWBhHR70mTM/pRltesuIKCvu7GQUH6Mrms2D8J+9B5kI9f1zNS+
	NvwVOkWTaVrz3TRqmU0VnK9pmrdsgqblGHazlMYOsapOx6iMJnZLpCQkjMUMVfXrD5IsDQIg+OaWY
	fsa5dQILdlyFTZBSjf7IVwK1AY5wgJPzn8wPkvgCIAHGOsmHHkN3jSKA5Hk4H9aWcWQ+Jqx9XwYMQ
	vF3US9LP9vckUtMnYxrrMXHqic+9Q1Pk4AMG1sXmuHgMxnMi3IOSBsFXL26E6Xv4U0Pn6t+8zyM2H
	lKsiwAkw==;
Received: from localhost ([::1]:33906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jU6f5-000AqB-SH; Thu, 30 Apr 2020 10:43:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jU6ez-000Aq4-4b
 for samba-technical@lists.samba.org; Thu, 30 Apr 2020 10:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=1tPmnwVEPChdky1Urbw8hQ8MFxx5qnBk1elSJ7y20o4=; b=svW+iUuS1bVHqysi6Fsdzj8TqV
 yx8Z9jxoWRGR8cwq2K+oJ1knKpXlDVKfcWyRfNJvrMGbdXhS+VXVf1o/flP5QrpuWxrDBxb79iesK
 g6BVVcQ/sIUuGrQOpgggzosgD+jrTuigMh31AmvILY7EGnbNnsXvK7JgYDAqgAEKlW3hJqUr2f2G3
 CUcsavX8B080zn7cTs/rhlGxr54G8BCZwpmGaGwuJqsJNnmC0ePZyG0DuWeb6jvT6zrCXCbBPMoeg
 8r0zL9Oy4qv3PJJ87JTAUlPMG67CWMj37PtMj6PfUgLlpuHGI+gMGE1hWW0vA7+2rq1A2xSueGuzu
 kdn2LV/PPuE72zSL7dGrs67+rx/id9r2IGRYWaVk0eZJe1cyCvLfxwAhONFl+XZV82vXihNXkKRM2
 1zpBdwqdnPVvznflnlnnxi29iYzmKOU/q8ERdFYnbymwKKDZX9RR9qtjxFISzz2e9Mfu4lxeFhhdb
 /p8WvU8tz7eZvIzyu9d23xOn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jU6ey-0007Sm-Hm
 for samba-technical@lists.samba.org; Thu, 30 Apr 2020 10:43:16 +0000
Subject: Re: [PATCH] Remove 'samba-tool user add'
References: <20170324092636.316bd8fd@devstation.samdom.example.com>
 <1490566775.13579.257.camel@samba.org>
 <20170327082840.6a00bc45@devstation.samdom.example.com>
 <20170329130458.GB7532@sernet.de>
 <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
 <0852b07d-1820-c037-8438-231138bd07bd@samba.org>
 <6c3e5a75-55e0-7206-ea5c-89b8b48308d5@sernet.de>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <4729fa7f-1279-1f5c-c5e5-714bcd7912eb@samba.org>
Date: Thu, 30 Apr 2020 11:43:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6c3e5a75-55e0-7206-ea5c-89b8b48308d5@sernet.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/04/2020 11:38, Björn Baumbach wrote:
> Thank you for your comment, Rowland.
>
> On 4/30/20 12:24 PM, Rowland penny via samba-technical wrote:
>> The problem with '1' is that there  will undoubtedly be scripts out
>> there that use 'group add', so you will have to deprecate 'group add'
>> then remove it at a later date and just look at how long it has taken to
>> remove 'user add'.
> Yes, my plan for '1' is to add the "group create", deprecate the "group
> add" and remove the "group add" later. I've just skipped this
> intermediate step in my description.
>
> Best regards,
> Björn
>
OK, but we do have an history of deprecating things and then not 
removing them, 'user add' is a prime example ;-)

Rowland



