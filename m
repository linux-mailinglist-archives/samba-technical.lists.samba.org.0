Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567A26A762
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 16:42:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nh8tAmjEfJ3nE8BN5hNXkR4OjdP3BGJ4jIbm6f+NRH8=; b=jvLItH/PTHBjbFNi41AjlcOu1+
	VV6vVPpzJFJEWEkVhY3LBEzSJT+kM+MK0osLNifTLxyWZOjnhbrSSa85lMzZIZDdJcl3wPk7f0/oX
	/V67Y9O/QPTAlBqObbJ3BbNV0KmeCY2XEPwvwPaEoNnOjmVM52+0hHtNLtMlWGTfWAJfgHS+GkVyF
	jg0vvuQIPcZhe8USYvHX/PGs0dJVdzSLWCv7HtchpYiJt/9bB5b1UzkMdnZZa4M8RHvm4iUkjcdOm
	ykfbmbfo66pyyZ022lc7dFepMSo5EkwdMPt/ncOoMhYFranEsxMhpS16B+R67hYUmo/qgXWEgMs6A
	i5PRq+SA==;
Received: from localhost ([::1]:30700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIC9G-005Vll-PN; Tue, 15 Sep 2020 14:41:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21296) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIC9C-005Vld-1M
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 14:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=nh8tAmjEfJ3nE8BN5hNXkR4OjdP3BGJ4jIbm6f+NRH8=; b=IHdndp4cwzIj04fWe/ChRoHVxO
 pfGUXPY8C0qIbclT6HUrNuxR3B2gUfbocpTBFYE4rwWST5otPyGDCTwczCu6NTK64LP3B7o6rwOg+
 M3NQ1vOS0tZiK09C59o3Ah1C/rDq+qBARqhNTdEUb6tx1SeOkLGpMD2OXlpcjQIdiewDeRIzYYczO
 lFx3egfKilw5P0j1Fdj2yYVOn1DD9u5fYo4XAhVJ80lrXX9LRg3lw2GvfUtDDyK0VqlvuCWbMGAe2
 FgoNkaPlby0qfMSwjxE7dhs2ugGsocvCtTQzkKevok0CUSZvCHOmd2JAGJ+eaHRwOTI7AQhp4CLIu
 ZW4ZGQ5I4hdujpMoWureBRRdyZRiGvBAzBTyJq4AKo15lwJ008lPjSMFoABytW5AQQ4uJi5u4hRTj
 izkj9gz1ZHeawanmZWWvrZMgVuaSo3d5wjtV71uy62+puRaevlKlH2/YdbCKdiFJ/d6mfiHxoVf1d
 LVUl0SlEBsC3gZCegmxIy8sa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIC9A-0001LY-Uw
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 14:41:29 +0000
Subject: Re: SELinux attributes in Samba domain
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
 <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
 <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <390168ab-7835-5750-cfca-3327596618b3@samba.org>
Date: Tue, 15 Sep 2020 15:41:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
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

On 15/09/2020 14:38, Mikhail Novosyolov wrote:
>
> 15 сентября 2020 г. 14:50:52 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists.samba.org> пишет:
>> On 15/09/2020 12:08, Mikhail Novosyolov wrote:
>>> 15 сентября 2020 г. 10:10:32 GMT+03:00, Rowland penny via
>> samba-technical <samba-technical@lists.samba.org> пишет:
>>>> Your problem will come with sssd, it isn't supported by Samba
>> (because
>>>> we do not produce it and no little about it) and even Red-Hat no
>> longer
>>>> supports it use with Samba.
>>>>
>>> What is the problem to use sssd as a client to enroll into Samba AD
>> domain?
>>
>> Before Samba 4.8.0 , the smbd deamon could contact AD directly, this
>> meant you could use sssd with Samba, instead of using winbind. From
>> Samba 4.8.0, if 'security = ADS' is set in smb.conf, smbd must contact
>> winbind, it can no longer contact AD directly. You cannot install sssd
>> and winbind together, they both have their own versions of the winbind
>> libs.
> Yeah, I know that sssd has its own libwbclient.so.0, but did not study details. I still can't understand the initial problem. If sssd and wbclient conflict on the client side, samba's winbind may be turned off, right? What does prevent from using sssd as a client for samba domains?
>
>> If you want to extend the schema to store selinux data, then this
>> should
>> be possible (you just need the correct .ldif), but you would then need
>>
>> a tool to extract them from AD.
>>
> In case of using pam_winbind, will it be sth like making an ldap query (using ldspsearch? or which tool will be better?) in PAM stack after pam_winbind, authenticating via kerberos and making a query for the current user name?
>
 From here: 
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/deploying_different_types_of_servers/assembly_using-samba-as-a-server_deploying-different-types-of-servers

There is this:

Important

Red Hat only supports running Samba as a server with the |winbindd| 
service to provide domain users and groups to the local system. Due to 
certain limitations, such as missing Windows access control list (ACL) 
support and NT LAN Manager (NTLM) fallback, SSSD is not supported.

I do not care if anyone says you can use sssd, the Red-Hat documentation 
says otherwise and they should know , they produce sssd.

Do not think that you can use sssd on a Linux client, because as soon as 
you add one share, it turns into a server as well, or should we just 
tell everyone not to use Samba as a server ??

Rowland



