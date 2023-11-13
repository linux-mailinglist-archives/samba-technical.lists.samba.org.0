Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 354087E9D46
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 14:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6OiTLud+yoVBH+r+tSp//k40Ti6bg8qeM74jXFlok6A=; b=gzc9iwTzL4iyr8onPU9enslq7P
	vuTGe4dLE/o795ALkkOik40Gr0iJ0ql57rmEw++7fmkw05NGWb2z243xaBzv/H6354lt10KsldV9U
	HpRQjyhT/JqCG7oqtUn3ZwE5kOaYks1LrhZ9bZLv3Pj6wsiPW85C1dCvpYkZOr9/jNAkh2pkn2d4s
	8s/D50zyKVtpX2GwNyE7BPk/ilG0TK0x95pt7/mU7pM5U+Tv1tpUydrgk7BopzvgIhAxMklhULan1
	5P7972p0153YgbEFjwT40D8HsJRD7xDtEWQHQ7hvQRuwAut8nPsdlfZIH2DimkHSXJM22rP+vKHcC
	GstVhZBw==;
Received: from ip6-localhost ([::1]:63788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2X6Q-007wAc-7r; Mon, 13 Nov 2023 13:35:46 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:60521) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2X6J-007wAR-Du
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 13:35:42 +0000
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-da077db5145so4388092276.0
 for <samba-technical@lists.samba.org>; Mon, 13 Nov 2023 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699882537; x=1700487337; darn=lists.samba.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AEy7EVabLA1mhc3+pHxHVBEynaTXCj8cLHcdMXsEvPQ=;
 b=JZgRG0jTC/ZiV6GstTs1Stto/sxE1txODQpN0A2LYDaX0BwnQ/qDtfDc7K10ZwhRN7
 DgToYRpww6/QOqAfE6OtbjK89q2xStoW+wqT2OJQKd6o2w+nba7NkAfZjujEzLcU5l0e
 tjNKgQjqBvc4oQiM+rcFDXEe7Y14/iJAf8Qyv6MGRVh6P9iXnxebfpdtrWKNATYBFej6
 rKvcyJ4xjCItwaSGWmJ3VA8q3stzf8TOsXgZRmonDldFjASMwDDI0WdZ26M7oMZcDUJF
 UKeLv7k6+3vdP1dVSVB+4fbijcaTlMQITrJnmRx3rLM0U+3zGZEaK3f00jpHZ6FFtuaj
 4WBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699882537; x=1700487337;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AEy7EVabLA1mhc3+pHxHVBEynaTXCj8cLHcdMXsEvPQ=;
 b=fvpdEchJIx4+edV+xbTseLtr/Bf0dPEMDMU487QfIGwyq7RGuhLUae57SSsBgKiKKU
 nGu2jg/spMd7+KGBVFIlwFGlgOpj+d3K6+85Q/pu52PyyV3dSNoyAL5+UuyoBjvzF3Lk
 PT+HopUvx1ablpgG0pWdwhL0GOIsZzpqF0Ymq6Bs4qZJvM8cSMjPMgQOV0UbEOs1nTo7
 As0UFuNX3kjZozh5uShH+HLZGC8fW4UMZP4quAepLogQktNsjOWFgUotL2O7SzNxzfR8
 jELEEdqDzguEKCU8POYHqymyeFkTKx7Ndd0ldcubiVtREXC50WR5CqgkkX4QAY6LJ2YR
 HryA==
X-Gm-Message-State: AOJu0YxuEe7kadyV0z2LD/kutSUGhcc+022Wj8O7gLoDs0ueodzjVhL3
 jTXS7yQ9TGbB5uT9NGasWPcoczi7c6uuh2/stKy+iVm0wZM=
X-Google-Smtp-Source: AGHT+IGhGCKCgRDg5/3FPiU+sh7tRLy8El5eBu/Uo0dJQRWs+feu4TJvFlHJTI5bKcYx03XVFnhbIDx48bSL8Ay4BmE=
X-Received: by 2002:a25:d7d5:0:b0:d9c:fa2e:3b7c with SMTP id
 o204-20020a25d7d5000000b00d9cfa2e3b7cmr6201622ybg.22.1699882537207; Mon, 13
 Nov 2023 05:35:37 -0800 (PST)
MIME-Version: 1.0
References: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
 <20231113125324.0cf1b58b@devstation.samdom.example.com>
 <CAOGObpi01iUPmGdB-KhjqNo8t0zgVWK8XJzjw8ATBYD0uWj8xQ@mail.gmail.com>
 <CAOGObpg3sK8soryGdY+BC=TG8=gctm-7gkR0LYxubkFMbGXXkg@mail.gmail.com>
 <20231113131844.1e590785@devstation.samdom.example.com>
 <CAOGObpi518QAHT61=NRBfNuyfCKT8+TV7Rf+Y0EX2YzCp5eqzA@mail.gmail.com>
In-Reply-To: <CAOGObpi518QAHT61=NRBfNuyfCKT8+TV7Rf+Y0EX2YzCp5eqzA@mail.gmail.com>
Date: Mon, 13 Nov 2023 14:35:26 +0100
Message-ID: <CAOGObpiU49+z0cQvvpqTZ5aW1ozzpKxz6x4GDeCx+iVwArAoeA@mail.gmail.com>
Subject: Re: Audit log dsdb_group_json_audit with with "userSid": "S-1-5-18"
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
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

Problem found (I hope)
The first thing is that is not a real problem, it a "samba-tool domain
tombstones expunge" for testing in console I did "samba-tool domain
tombstones expunge --tombstone-lifetime=10" and the output is the same of
my first post

Il giorno lun 13 nov 2023 alle ore 14:24 Cristian Galvani <
galvani.cristian@gmail.com> ha scritto:

> wbinfo -s S-1-5-18
> produces as expected:
> NT Authority\SYSTEM 5
>
> what I can't understand is the origin of these activities that don't
> really exist ;(
>
>
>
> Il giorno lun 13 nov 2023 alle ore 14:19 Rowland Penny via samba-technical
> <samba-technical@lists.samba.org> ha scritto:
>
>> On Mon, 13 Nov 2023 14:04:51 +0100
>> Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
>> wrote:
>>
>> > Right,
>> > is mapped to  'NT Authority\SYSTEM'
>> > Samba version 4.16.11 on all DCs
>> >
>>
>> Strange, there was a problem where 'S-1-5-18' didn't get mapped, but I
>> thought it had been fixed.
>>
>> If you run 'wbinfo -s S-1-5-18', does it produce this output:
>>
>> NT Authority\SYSTEM 5
>>
>> Rowland
>>
>>
>>
>>
>
>
>

-- 
_______________________

Via Bruno Buozzi 24 - 43126 Parma (PR)
Cell: +39.339.2612261
M@il: galvani.cristian@gmail.com
_______________________
