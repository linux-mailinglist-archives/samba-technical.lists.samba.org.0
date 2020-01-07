Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65E1328D9
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jan 2020 15:26:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6cI3qwgkZ/aHl23u43wP27CEwMXccGcVtj4bSM6IuYU=; b=wMoq7YlQvYbLfNw+Dy0J6m0M2C
	2m/VLX1T5WHLtwFyhUu3sLqvWmVLxGO04rT4cLHAapIZN4lW6bJ05i3+ODRjNI96QkTIqwykz/7zG
	ir7JVqh+xKp7LX8muxGgVOT3PZ0GWOiua1u7ObFSbX9+GIgh+OT1Wj1XhApFyrB7kyeG1o9TJx0zC
	2ckXu2yuBfl/6qfSZFyR+mj+5cYM4gavlZZ7TrrQOSFtAg2s5iP3/cGW89vKatdMzMe0avNip4tFB
	SGrjzxmqiKdiWWqEjmW0mrSe1rF+gEZObBPzNysVaQMiToVi2LT/q4iZEH5djbUarfHV/GLyyiQtH
	kTu5Vo2g==;
Received: from localhost ([::1]:35702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iopns-002ftq-Ry; Tue, 07 Jan 2020 14:25:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iopnp-002ftj-2A
 for samba-technical@lists.samba.org; Tue, 07 Jan 2020 14:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=6cI3qwgkZ/aHl23u43wP27CEwMXccGcVtj4bSM6IuYU=; b=dI85CCrkgYj6MBkY8Ln66hZACl
 FK19H2qQ9aH69o4+eHMm/EKfl2Qft5DT907gSSWhKVSvzEIQaYR2GyTfEvyQvRRZ+qvQhZuvLwed7
 nQJ3KXJujA0FYXhNRplAY3xw/Gkla/JkGGiTU7OwI03zJ1ax4hprME0eAG0OuYeTjJpuaYJcdfbHk
 OAociUb3JZcX4xDq+iWO+VoRa/nuwZWHRJsI/qXz0Nh8inlt4+QLAl0ytgywZCVVP+ixhWPKu5PD4
 dvMfQd1V4k0GQL7D48lZl8/npjDJRP0yVahH36oX4M3GaCgm4Ycqvz9qGvaKii+p6O9N7SMCf5UMG
 4JGXi4tY22c5cl9uSxcuOmPfQT5lr6FljqO7i22sKVU7Zx+/1l/MqnXCmADN73pUfN4yDHa3aOP1Z
 X2HrVKSrdT0iJ6rzFT6UX5yPX22MZbNarJXOKamxL5ITZUscwo3a+zIp0CBzSTFKW9ERUkgW52ovB
 LNyMMUlHktTrZ3o5T7i4GBGv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iopnn-0005yi-JA
 for samba-technical@lists.samba.org; Tue, 07 Jan 2020 14:25:47 +0000
Subject: Re: [PATCH] docs-xml/winbindnssinfo: clarify interaction with
 idmap_ad etc.
References: <20200107093340.GA7605@sernet.de>
 <ad2ab7ff-21b2-92c1-03e7-48698d133363@samba.org>
 <20200107121804.GA11511@sernet.de>
To: samba-technical@lists.samba.org
Message-ID: <41a9c5b3-a13c-f2b7-111f-1e77339afbc9@samba.org>
Date: Tue, 7 Jan 2020 14:25:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107121804.GA11511@sernet.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

On 07/01/2020 12:18, Björn JACKE wrote:
> On 2020-01-07 at 10:30 +0000 Rowland penny via samba-technical sent off:
>> Domain Controller supports the Microsoft "Services for Unix" (SFU)
>>
>> instead of:
>>
>> Domain Controller does support the Microsoft "Services for Unix" (SFU)
> I'm always happy to improve my English grammar skills, can you say why
> "supports" is wrong here or is this just a matter of taste here?

I would never say 'does support' in this context:

your Active Directory Domain Controller does support the Microsoft 
"Services for Unix" (SFU) LDAP schema.

I would say:

your Active Directory Domain Controller supports the Microsoft "Services 
for Unix" (SFU) LDAP schema.

It is just the way that we English speak ;-)

>
>
>> Make sure to consult the documentation of the idmap backend that you are
>> using.
>>
>> As it only works with idmap_ad, wouldn't it be better as:
>>
>> Make sure to consult the documentation for the idmap_ad backend.
> honestly I'm not entirely sure that no other idmap module can work with this
> parameter also, for example idmap rfc2307. Actually if no idmap module is left
> that supports this setting of winbind nss info, then the only parameter left
> for this would be "template" and then we should actually remove this parameter
> entirely. There might however also be third-party idmap modules, which make use
> of this setting of "winbind nss info" and this is why I carefully chose the
> words this way (for now).

As far as I am aware, idmap_rfc2307 only uses the uidNumber & gidNumber 
attributes, so, like 'rid' & 'autorid', it only uses 'template'. If 
there is a third party idmap module, Samba knows nothing about it, so 
shouldn't even be considered.

Unless the idmap_ad module is removed, winbind nss info is needed and if 
used in smb.conf, we should point users to the relevant documentation, 
which in this case is 'man idmap_ad'.

Rowland





