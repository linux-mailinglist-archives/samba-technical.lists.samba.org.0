Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F326A783
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 16:49:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=mjJSWi9mlfAJKbTVPt34bBoSB+jsGv0lDJJp/IQ4yrs=; b=4iKvfXKv4xFWeH38wUAc6hLjBr
	Ey9OrO+dbRzKfGdzLwBNZzXnpSf4hp+LQ0914wQ+GOChaoupBqciKV1GvQ5EjpGfRnh2SRLq3+tm0
	CZ/Ko08qTt+lzU5PtU/f6EfFcOxbG1qedWPqLWp/sCbjhlopcHllJPOKQ4W+TuzM7X+rRDEhJ8Dd5
	366I6qTWtxZFRyQSJIxKP+S+HnvlepIdGSXx3HisVRLN8FVXAYvDEtvaOSlsbZKSV7NM/+3Kbg5/y
	fenDDwnm0wVNmQTM/FHY4wuOUkh7DlLLvy0pJqtWa22rXPZdsUY8/vOnlab8XS2bJxHsHiY5yuHDZ
	C3atyaxA==;
Received: from localhost ([::1]:31448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kICGc-005VsA-Ps; Tue, 15 Sep 2020 14:49:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kICGY-005Vs3-IW
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 14:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=mjJSWi9mlfAJKbTVPt34bBoSB+jsGv0lDJJp/IQ4yrs=; b=QfQb1KUwLt7sVilYoKNpdWAF4b
 rj5t3Wh1qlUi7SfMoqrk7gv2OIZAGNzT9L7LE6iC9E5BwEWqAfbC/t0voAA9P7uQlm9zzW3uOCKlv
 tPBSGTWwZ0AoqOBqhixtJqKkloebJmoT/Nk88S48k67rLY9pVzAcAKdSDeI101utNXCBImuARVt21
 2HqhlBrANAsY6IiQq+LaA8DhhlH4p0/E5+4LL2sLrm+J5g6bQwZaGxyXMQYjORU/+KXgGz//HUUQ0
 5F8qpdiyp5xUV7w+feZKRXHh9irALT/a0BvoECMsGF9q3TKoLzRyBBch6lAUuhspP52jtHu0WO8hX
 3Gi6vKk+1xRuonAQT5MylEoRMYpYidhtLVvpZM8SLhyPzht5Dsuspb+T6E5oBWDIdxABYOh/BS5SG
 /aOCFlAkknc6fukGKiV65U4D2A3LjEyh1c3NXYPxLttupA2YVcg5OIMnNuqNCog7GVlxtIPcVYKzu
 Hd6KcvVr4aObizNDhIDM5Gbj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kICGY-0001RV-3Y
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 14:49:06 +0000
Subject: Re: SELinux attributes in Samba domain
To: samba-technical <samba-technical@lists.samba.org>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
 <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
 <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
 <20200915141333.GE23377@pinega.vda.li>
Message-ID: <162cf830-3de6-bed3-d424-99f90ad074aa@samba.org>
Date: Tue, 15 Sep 2020 15:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200915141333.GE23377@pinega.vda.li>
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

On 15/09/2020 15:13, Alexander Bokovoy wrote:
> On ti, 15 syys 2020, Mikhail Novosyolov via samba-technical wrote:
>>
>> 15 сентября 2020 г. 14:50:52 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists.samba.org> пишет:
>>> On 15/09/2020 12:08, Mikhail Novosyolov wrote:
>>>> 15 сентября 2020 г. 10:10:32 GMT+03:00, Rowland penny via
>>> samba-technical <samba-technical@lists.samba.org> пишет:
>>>>> Your problem will come with sssd, it isn't supported by Samba
>>> (because
>>>>> we do not produce it and no little about it) and even Red-Hat no
>>> longer
>>>>> supports it use with Samba.
>>>>>
>>>> What is the problem to use sssd as a client to enroll into Samba AD
>>> domain?
>>>
>>> Before Samba 4.8.0 , the smbd deamon could contact AD directly, this
>>> meant you could use sssd with Samba, instead of using winbind. From
>>> Samba 4.8.0, if 'security = ADS' is set in smb.conf, smbd must contact
>>> winbind, it can no longer contact AD directly. You cannot install sssd
>>> and winbind together, they both have their own versions of the winbind
>>> libs.
>> Yeah, I know that sssd has its own libwbclient.so.0, but did not study
>> details. I still can't understand the initial problem. If sssd and
>> wbclient conflict on the client side, samba's winbind may be turned
>> off, right? What does prevent from using sssd as a client for samba
>> domains?
> libwbclient from SSSD is deprecated and should have been removed
> (already or in upcoming releases). It should not affect any operation as
> its use is not needed. For cooperative setup where both winbindd and
> SSSD work together on a client, idmap_sss is what is needed in Samba
> configuration.
>
> There is no problem in running SSSD and winbindd on a client side; the
> catch is what use case we are dealing with. SSSD does not support
> pass-through authentication ([MS-NRPC] sec. 3.2), so it will not be able
> to authenticate users from domains unreachable by the client through
> Kerberos trust path link towards their domain controllers, but for all
> other situations SSSD should just work fine.  Technically, it is
> possible to use a direct LDAP bind account from that user domain to make
> it possible for SSSD to talk to that DC (it doesn't need to be a machine
> account, really), so even with this case it is possible to have a
> combined setup.
>
> Note that in this case winbindd would not be able to pick up any POSIX
> attributes too because it wouldn't be able to reach the user's domain
> global catalog or LDAP instance on that DC either -- using LSA
> functionality it is not possible to query anything beyond basic NT token
> details anyway.

Thanks for backing up what I am saying, if you use sssd with Samba it 
isn't as good as using winbind, so do not bother.

Before anyone accuses me of hating sssd, I don't, I just do not see the 
point of using it with Samba, winbind does more. I used to use sssd 
until I realised that I only needed to setup one conf file to get the 
same data.

Rowland




