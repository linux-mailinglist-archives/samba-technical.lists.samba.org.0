Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F177E9CB9
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 14:05:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=O+m0JLru6rxn/mMm3ZdsfsFUwgwzHff4hdHskM7YQ2w=; b=Pg3FXWLXzGxwFKCyrJLFTpX506
	1Y3TPrSkKykvT+ZvLVQ34pCcWEwrBakfTWuO1NW9i/YG0oz0oOKxAHYBi2Rkp+aGYdTYvtYg40NyA
	7WOyHZtmLYdPsw6tFZFAU+6spRqDQf9z94iDuwU8W53kr2xPNr0n6gXut7HxsB3a+Z5gHqZh+EQlJ
	AQTSPxh9HOkdoBYzdAdSG2AfiG7hb5QBbVOPeZK1y1sC8yHrQyFjDXu0y+UP0PtgfNVnP3oxLq9gZ
	Yt1odfzA3GpPCHB4sVHoSf7rxR0/Yjuo5sxCTZsh5qmVm/z6sgWHNza43uvDzdEIIvBsWLY+6OtTi
	jdwhbOGQ==;
Received: from ip6-localhost ([::1]:35932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2Wct-007vIm-1Z; Mon, 13 Nov 2023 13:05:15 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:61518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2Wcm-007vId-BU
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 13:05:11 +0000
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d9fe0a598d8so4324859276.2
 for <samba-technical@lists.samba.org>; Mon, 13 Nov 2023 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699880702; x=1700485502; darn=lists.samba.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b1e677sM8Kj9MG85kvCP389g657GUQboPA6Hyxs9Ju4=;
 b=U9ZDXZ7OERXWCgEi64bTINzSHU9G9D9zPEcDWvGytrvoQMOjFs1GbrSb3GKonb5+Fl
 lQpI4gfUp5tchOJ+1nKkkRs3JA00ktJbuzsSTUhH17Tyi6gs8mdBzOOK+3v00GYDtgPK
 RwIrUKCWjvwTsNfmzSmxlw//ICMSm1xNX9eE4eV1GRG1/gXruaWNPNrDOJgA0h+0EkD4
 8QIE377CtjNaVDVmvECSmC/ZB+rDtx79sf0BGxckQN7lawOpWMAzoSVnC2c0RGUzqpHp
 jvrpuWaJguYYRE6UgS6CIJXCmWEfwcnxWzI45PXsijlL8DZEnYlL4bdm/onNGXMt66p0
 da8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699880702; x=1700485502;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b1e677sM8Kj9MG85kvCP389g657GUQboPA6Hyxs9Ju4=;
 b=mU02QoTm+bANKeLcPtRQOzbFiechUtOARZzApNHtR8izCNahlW7TWky5E2PTwHspFD
 xIJKK4ajeLjKBQlROfbTStuulPStWbl4lV8uwDEykY0Z1CJSwSRS0ApMLkaZKzSqbpo+
 L3DeuD8aQuPcknL1r/RGvy9KnJEvX5TTeBEDpl58IaI3ENbf3Qvl6Sb5XrerMwA8Tgh5
 Mq7TMxOMJe5RTV3cmO4GorG9iWKHP86vtROZ3ian19bpkHWAoIMkgkOd6z+2py/10Zuf
 cpVLqNCt4DFbwLPk9RCpOJI8SxjBpVXZnPX678AHhDzHVxQhCyJPKBtY1pRz+JBkBD/i
 qZmQ==
X-Gm-Message-State: AOJu0Yy7wSvXzzS87Rgkm3X5ZJ3o5bwdRLNV8BizMQ2IXrKUYLy1F+Ru
 WnUdJ2xpa0exxsZrdcA14k2h3YItlvCRQHBHls4KauAub+Y=
X-Google-Smtp-Source: AGHT+IFcfogmg8DTn9allojayk3p+fRYjI3rvWkDM8l8QVAK3GHH0ptZOmVToXjyDUFdf1SeloP5HiULMSfEVfCHtOk=
X-Received: by 2002:a25:f622:0:b0:d9a:4d6f:1b27 with SMTP id
 t34-20020a25f622000000b00d9a4d6f1b27mr5577692ybd.10.1699880702025; Mon, 13
 Nov 2023 05:05:02 -0800 (PST)
MIME-Version: 1.0
References: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
 <20231113125324.0cf1b58b@devstation.samdom.example.com>
 <CAOGObpi01iUPmGdB-KhjqNo8t0zgVWK8XJzjw8ATBYD0uWj8xQ@mail.gmail.com>
In-Reply-To: <CAOGObpi01iUPmGdB-KhjqNo8t0zgVWK8XJzjw8ATBYD0uWj8xQ@mail.gmail.com>
Date: Mon, 13 Nov 2023 14:04:51 +0100
Message-ID: <CAOGObpg3sK8soryGdY+BC=TG8=gctm-7gkR0LYxubkFMbGXXkg@mail.gmail.com>
Subject: Re: Audit log dsdb_group_json_audit with with "userSid": "S-1-5-18"
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
Reply-To: Cristian Galvani <galvani.cristian@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Right,
is mapped to  'NT Authority\SYSTEM'
Samba version 4.16.11 on all DCs

Il giorno lun 13 nov 2023 alle ore 13:57 Cristian Galvani <
galvani.cristian@gmail.com> ha scritto:

> Right,
> is mapped to  'NT Authority\SYSTEM'
> Samba version 4.16.11 on all DCs
>
> Il giorno lun 13 nov 2023 alle ore 13:54 Rowland Penny via samba-technical
> <samba-technical@lists.samba.org> ha scritto:
>
>> On Mon, 13 Nov 2023 13:37:42 +0100
>> Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
>> wrote:
>>
>> > Hi!,
>> > I have 3 Dc in my network, I enabled dsdb_group_json_audit on all of
>> > these to json file.
>> > smb.conf:
>> > *log level = 1 auth_json_audit:3@/var/log/samba/auth_json_audit.log
>> > dsdb_json_audit:3@/var/log/samba/dsdb_json_audit.log
>> > dsdb_group_json_audit:5@/var/log/samba/dsdb_group_json_audit.log*
>> > Everything is working as expected, if one my colleague on his local DC
>> > change  group members the activity is recorded properly.
>> > The problem is this, *on all DCs log file in the same moment* there
>> > are some strange  activity recorded with userSid "userSid": "S-1-5-18"
>> > and "remoteAddress": null.
>> > all the activities record the removal of members from some security
>> > groups but some members removed from those groups were not even
>> > present, I am sure of this information because I restored a backup
>> > prior to the activity and the user was not present in the modified
>> > group.
>> >
>> > Any suggestions?
>>
>> 'S-1-5-18' is the SID for 'NT Authority\SYSTEM' and should be mapped,
>> what version of Samba are you running ?
>>
>> Rowland
>>
>>
>
