Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476A10CF0B
	for <lists+samba-technical@lfdr.de>; Thu, 28 Nov 2019 21:03:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=o9NJCsKetMF5k6Skz7dZQ+NCAnNsvPDHnVwOQMm4ZHs=; b=Lk0eo7QuSJnoA+BQnYP3Lpjj+f
	6Dm2XHwbIvV3/3begX0tDHYUUha0nQwOsjJ8RqKvWW3XE+PNzo+z3qOoo7iBlzayVIZMtSzTrA4ky
	6zdYPbw760huo9TwS4YhhEBGohyK5xqS6AhMQ9nqmXAu0gQyR3iRFRZtg93BZ/GNHblgdpJjOinxP
	Mgv9ysKB4U1wse1cuuO3Z0E1HGcSYOepjxds7VFu2+91W0c/mDc/eq74ey0nmiJQ2p0H4LYIcDLo3
	rmNZOod+Hp228RTaD3ThGAzlRKKeUWkOxVLBPj7wduwm98ZotRacacvYPcKQWWhEYjUiszXf/Jndu
	0jE0eU6A==;
Received: from localhost ([::1]:35846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iaQ0L-0035PB-VD; Thu, 28 Nov 2019 20:03:10 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:40780) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iaQ0H-0035Oz-3Y
 for samba-technical@lists.samba.org; Thu, 28 Nov 2019 20:03:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 69B36D4F9AFF1;
 Thu, 28 Nov 2019 23:03:01 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6pleqj2H8jX8; Thu, 28 Nov 2019 23:03:00 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id C3E6BD4F9B01E;
 Thu, 28 Nov 2019 23:03:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru C3E6BD4F9B01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1574971380;
 bh=o9NJCsKetMF5k6Skz7dZQ+NCAnNsvPDHnVwOQMm4ZHs=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=oLE+x+34uXRD5O0vF5r9uopALXe7kkNqJAS8db3ac3mwzWRGGhYtJRVsqSyas66US
 GsH8hHCnb4TyZn/zebPGhpEH379rCCX4Sa8ixl3OijcbPKOP6uE2TpVJm1Y+dfPX0U
 ZaCHKFa6Q3dzI+z/nJht4kquZUswd88j+zJYbotmxTbHoKrvTK/R9UeIwZbDuOmCrv
 wdgsjBsp7EorsWXcn48M49PCCJdKoMBTsJB0gUa4lJR+gHQY15DU08hos894zUDRXR
 mouikh4M60jmfzSa2Hf7UVN+Y05UoiOm6YN9NjePxUw6Wgbu5xKrUjOQZ8cs/62fkB
 Ju0eWvN09DYnw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oWITDaemjf5C; Thu, 28 Nov 2019 23:03:00 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-152.ip.moscow.rt.ru
 [90.154.70.152])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 90491D4F9AFF1;
 Thu, 28 Nov 2019 23:03:00 +0300 (MSK)
Subject: Re: smbspool without authentication no longer works?
To: samba-technical@lists.samba.org, andreas@canonical.com
References: <CANYNYEEyavNVwax-aWu+qLZYMw+f=hFNA=6WH2gREh9WjHQ8oQ@mail.gmail.com>
Message-ID: <94f7c58e-ee8e-9aaa-d442-2f589d2c2767@rosalinux.ru>
Date: Thu, 28 Nov 2019 23:02:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CANYNYEEyavNVwax-aWu+qLZYMw+f=hFNA=6WH2gREh9WjHQ8oQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
Content-Transfer-Encoding: quoted-printable
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

28.11.2019 21:11, Andreas Hasenack via samba-technical =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
> Hi,
>
> is smbspool supposed to work without authentication, in the case the
> printer is shared like that?
>
> I've been tracking some bug reports about printing no longer working
> with samba 4.8 or higher. The last one where I got this command below
> to work was 4.7.6:
>
> ubuntu@bionic-smb-printer:~$ /usr/lib/cups/backend/smb
> smb://10.10.1.6/ds216laser 34 root page 1 options .bashrc;echo
> Kerberos auth with 'root@WORKGROUP' (WORKGROUP\root) to access
> '10.10.1.6' not possible
> ERROR: Session setup failed: NT_STATUS_ACCESS_DENIED
> DEBUG: get_exit_code(cli=3D0x561bb8db7d70,
> nt_status=3DNT_STATUS_ACCESS_DENIED [c0000022])
> ATTR: auth-info-required=3Dnegotiate
> DEBUG: Connected with NTLMSSP...
>
> ubuntu@bionic-smb-printer:~$ echo $?
> 0
>
> With, say, 4.10.7, I get:
> root@nsnx:~# /usr/lib/cups/backend/smb smb://10.10.1.6/ds216laser 34
> root page 1 options .bashrc; r=3D$?;echo;echo $r
> kerberos_ccache_is_valid: Failed to get default principal from ccache:
> FILE:/tmp/krb5cc_0
> DEBUG: This backend requires credentials!
> DEBUG: get_exit_code(nt_status=3DNT_STATUS_ACCESS_DENIED [c0000022])
> ATTR: auth-info-required=3Dnone
> DEBUG: Unable to connect to CIFS host: NT_STATUS_ACCESS_DENIED
> 2
>
> If I pass "anonymous" as the username, or even a blank space (!), then =
it works:
> root@nsnx:~# /usr/lib/cups/backend/smb smb://\ @10.10.1.6/ds216laser
> 34 root page 1 options .bashrc; r=3D$?;echo;echo $r
> DEBUG: SMB connection established.
>
> 0
>
>
> I found several bug reports, but none seems to address this issue
> exactly. Some were about printing with kerberos.
> https://bugzilla.samba.org/show_bug.cgi?id=3D13832
> https://bugzilla.samba.org/show_bug.cgi?id=3D13939
> https://bugzilla.samba.org/show_bug.cgi?id=3D13970
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1700791
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1706090
>
It was fixed in Samba 4.10 but was not backported to samba 4.9:=20
https://bugzilla.samba.org/show_bug.cgi?id=3D13939

Yes, people report that it worked in 4.7 and broke in 4.9. But now it=20
works in 4.10.

"Failed to get default principal from ccache: FILE:/tmp/krb5cc_0" - this=20
means that ccache of root user is being looked for. You should symlink=20
/usr/lib/cups/backend/smb to smbspool_krb5_wrapper, then ccache of the=20
printing task creator will be found and used.

Please read a recent thread=20
https://lists.samba.org/archive/samba-technical/2019-October/134470.html=20
"Automating usage of smbspool_krb5_wrapper" from start to end, in the=20
first email problem is explained and in the last patches are attached. I=20
would appreceate if you test them in Ubuntu: they allow to symlink=20
/usr/lib/cups/backend/smb -> smbspool_krb5_wrapper instead of smbspool=20
and make printing work out of the box both with and without Kerberos.


