Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA1B3D7106
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jul 2021 10:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Knf4DpJyiPMQjBcEEmgxugGilE5u7AuhwGwj8/wofHA=; b=P/UEr5EY4o6ZffYPqR09wRwyPE
	wQnRqiQ05jmyVIW8gLnNkC9OOnoz1QoeH4DjASeUMMbbi8kxi1YoO9ey4/Ckb8V9FFP00YjDSkDT9
	n70gd1TDDhorcceB93TpqGdWRdWO05BQPhySZYRUx5DHGS3beivuZNYD8wKeH4GM77f+B+vfNGs9s
	YpbaAPzUMngp6KP9IzOXZmZQjtaJgCTWrIpDHO8oTv7vQrGiZ2AhXJ+ZXbK13EoWb1Lf1BGbHOa+3
	4ysAyMVypygqnt94P/5TNgrpCtRjWA3p/x7UXAO0QNC+JAvEd2IX6yF5oby8CL++U4ttmlrw4VhlH
	kSONk19A==;
Received: from ip6-localhost ([::1]:28730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8IHt-0015cJ-R4; Tue, 27 Jul 2021 08:18:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30870) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8IHo-0015cA-Qk
 for samba-technical@lists.samba.org; Tue, 27 Jul 2021 08:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Knf4DpJyiPMQjBcEEmgxugGilE5u7AuhwGwj8/wofHA=; b=n12YiynkI1WjEMgzLFFbMZ5ELp
 bxZLKL0WcRrIH+SisZa4NeCl9CBek8uscOFGokOJl9os18ZMEs9yW0xCnwuxJVTUSOaJF6QXEPrDm
 bR/pHJyoypUJZfstNdI9CGw3foLGIp8pWuQjKh1+0C6s92JaUXpu/dYeF+/AoZUCgyjAY6LcLpT8N
 GcYD/v4EuzaBjdWsYEdjmc/MeHtqxFvPC50L5w1QxwuaoNv5q/DYUOiOG/UqJakxxpIID/ra9SP5Z
 V/0albuHQ8yGbibdYHmp07MIH4LCAPew7A+qGA7+vtauqFo/1CYs7g4nmLH3FL6qMnkbYlEF/+6Mb
 MfKz6BguesUMHyKf2DqBSTfmhWwP5+ZSZ6bSVghmg57C/RWsFufmWQsumr8AxExIZqzj2FPgjUQBy
 g+84Lk6wv0TstThSbenSqu8tguyv76F6tRH/ikKxua7W/yjtM2fokKGlzCMDG1WDw93DxeIVXSllB
 6qobzYI2k5QZvQcVe1slp4CC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8IHo-0006vk-0V; Tue, 27 Jul 2021 08:18:00 +0000
Subject: Re: Is "acl_xattr:ignore system acl = yes" recommended?
To: Rowland Penny <rpenny@samba.org>, miguel medalha <medalist@sapo.pt>,
 samba-technical <samba-technical@lists.samba.org>
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
 <201468d0-47c0-1a5a-efdf-7206e70f7e8b@samba.org>
 <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAGkqX8XX4T5Mg4ytd667iVsBAAAAAA==@sapo.pt>
 <bac38c9b-31ce-a544-e541-ddfc8edd10ad@samba.org>
 <5960b230b312bfbe898b1c9e21140af76135b6c3.camel@samba.org>
 <39d50c62-fcce-72fe-e95f-141753411a7a@samba.org>
Message-ID: <8a1b7f8e-9f7b-dbf4-06af-90927fd6f772@samba.org>
Date: Tue, 27 Jul 2021 11:17:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <39d50c62-fcce-72fe-e95f-141753411a7a@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 7/27/21 11:12 AM, Uri Simchoni via samba-technical wrote:
> On 7/27/21 10:49 AM, Rowland Penny via samba-technical wrote:
>>>
>>> regarding 0666/0777, I'm afraid that's enforced by the acl_xattr
>>> module
>>> if ignore_system_acls is set.
>>
>> Yes, but it very probably shouldn't be
> 
> That originates in https://bugzilla.samba.org/show_bug.cgi?id=12181 and 
> https://bugzilla.samba.org/show_bug.cgi?id=12181.
> 
> The smbd process assumes the unix identity of the user that opened the 
> connection, unless, maybe, "force user" is also used. Given that, a mask 
> of 0600 will make the kernel get in the way again, so that's why the 
> hard-coded setting of 0666/0777.
> 
> I agree that we could get the same result by setting "create mask" and 
> "directory mask" manually -  it's largely a balance between getting the 
> configuration options behave according to their name, getting the right 
> configuration by default, and maintaining enough flexibility for all use 
> cased.
> 
> I hope that helps,
> Uri.
> 

Sorry, the "and" should have been 
https://lists.samba.org/archive/samba-technical/2016-August/115779.html


