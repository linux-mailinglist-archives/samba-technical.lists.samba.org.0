Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D08461FF
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 21:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=f5Sj3yh8bhMQ+aiuMfzKVPfym1peZzawt5LsX9GEtjM=; b=WhYXHzlIzaZfCGxkErm9ZZoJYC
	bv7T5OWCQPuMbiBEpa7fL6b0b4lYJFKTDB4r5wDqtZ8k+iysmIhPeFCqfmWIzQYbLyMbzfvwNGUoi
	jfZFIuPwabE71RJ50TYqqDod4w/vKhzhFGwoi2r8sRePm2hBUrfPXiYRvaBFotzHi3i+2Hm/vYHei
	jle2Cm9uaTtmiUhwlxjM8eAy4zfk9fnTFrE3Se9jcnLpaoRmYSJSe55tHZmMr0f4wQlcLr/IHPs0a
	887ypEwbcLUeCxpPf8XoD4V+B/GsLe2tbm0nviZ5fy4D8jEcaYlToJFhLi/F8PGtzxKuKwHihuL7/
	7h3DBlyA==;
Received: from ip6-localhost ([::1]:24308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVdoI-007Iue-Br; Thu, 01 Feb 2024 20:37:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:53456) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVdoE-007IuX-Oo
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 20:37:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55fc9a581f8so1065608a12.2
 for <samba-technical@lists.samba.org>; Thu, 01 Feb 2024 12:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706819837; x=1707424637; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f5Sj3yh8bhMQ+aiuMfzKVPfym1peZzawt5LsX9GEtjM=;
 b=BvYQ0Qaoo9S4xXkfpgqDnz/IZC/1XOLHNOQyEIxllKCz60Wbz8Fje3v4oFS+C/v7H8
 cX23SJ+CfislWcLZ7UcwbT+HxyndCdELdFhdB64VbCGtsKsQwiI8aPjhnLVRrZOj1v5h
 BPSou5tuR5Ims3yswLyyLN5NP971Nt09llbZFkCJdCwdQuyzN6aSjZi0XPSkCLeqELiW
 bxydjmpNKJp4TEMWeSGYfebjGSx8JBwENUTVyMOq9v0oCQCP+VwojYDPl39aNiH8e64W
 dtOjdwF3nXrKILaPC4/G28ZhVZtKRS+97FAjmva0gZGUooE5t+gNzEFXC14zg9R88pay
 p+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706819837; x=1707424637;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5Sj3yh8bhMQ+aiuMfzKVPfym1peZzawt5LsX9GEtjM=;
 b=csA3PsDtbOQbIPRUfitsdA8thaxF6qclsKgCKsS/y89rOdZawQeQSgXzx3a8OuHDwD
 dfwb7R6kGbiYw28uPZfPvwFSiKqqllji28AzKZqKTs9lCjrfAUOCDhu7ULqhcLG61zW4
 SogIL7auqApWOBB9gvmTzACmoy3e0d6dYqNba+6zp/2Ob8TgiEYWci4+mB3151MjcY5j
 3YXCtOm20AkvYc2dGFSwaLdm2dosbqQrQmk3E5DZTIqrJyZuOUshPCODLWTHqK60HCNY
 8zIxmOCehMbjjyD9zkja6j34IHUyBPqJAbUG1IaGTD3JHu+FqWh9EXpcQTV3PZqjCcnJ
 exAA==
X-Gm-Message-State: AOJu0Yyo/X6My4sxVQUJ6m9unjWnGLFC72yZWrSCb2pdP5lMkgAo0Iav
 4WLN2hcL6nAECaplc3ZR0BtLQYynw47jDMJWGvuOzJZTDA1WxgPa/8KV6lOE
X-Google-Smtp-Source: AGHT+IFVliObAn9hsaIqTbWzf6lkj6652RCcjJbCIQGXTk0ya7OhmjbTqt/cv/OB2jak06flJhL9Ww==
X-Received: by 2002:aa7:d341:0:b0:55f:c9cb:208a with SMTP id
 m1-20020aa7d341000000b0055fc9cb208amr1611512edr.35.1706819837468; 
 Thu, 01 Feb 2024 12:37:17 -0800 (PST)
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 c10-20020aa7d60a000000b0055fa318d77bsm159911edr.27.2024.02.01.12.37.16
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 12:37:17 -0800 (PST)
Message-ID: <b978bca2-947d-4f66-851c-9db0ee4def57@gmail.com>
Date: Thu, 1 Feb 2024 21:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: State of unix extensions and symlink support
To: samba-technical@lists.samba.org
References: <2c310e00-84ac-49d7-88f4-e742d9170088@lrose.de>
 <CAH2r5muS+w+pv-32pYhui7yyvitdmCgbkfZdmbTyo3ffOHKpqA@mail.gmail.com>
 <B3566794-B5EE-48C7-AEF4-EC9E9477ADA4@lrose.de>
 <Zbv6YVRRuyluQM3i@jeremy-HP-Z840-Workstation>
Content-Language: nl, en-US
In-Reply-To: <Zbv6YVRRuyluQM3i@jeremy-HP-Z840-Workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Kees van Vloten <keesvanvloten@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 01-02-2024 21:09, Jeremy Allison via samba-technical wrote:
> On Thu, Feb 01, 2024 at 08:41:14PM +0100, lukaro via samba-technical 
> wrote:
>> You're right, mfsymlinks is a workaround, but I need the symlinks to 
>> be symlinks
>> on the Server as well.
>
> That creates a *HUGE* security problem and a rich source
> of future CVE'. Samba will likely by default not implement
> server-side symlinks created from an SMB3 client.
>
Does the issue include relative symlinks within the share?

The usecase I have in mind is this one: I have a git repo that contains 
symlinks. The repo is cloned in a path in my homedir (currently shared 
nfs from the server /home). Now when I ssh into the server I can still 
see and use the exact same git repo tree and follow the symlinks it 
contains.

Would I use smb3 the cloned repo on my client is unix usable, but the 
same file tree on the server contains unusable reparse-points, i.e. the 
server view of my repo is completely useless. Not nice!

I do understand the security concerns, though, but it would be nice if 
there would be a way to be able to get the same unix-like dir-tree 
everywhere.

With the above restrictions, the only way I could see this happening is 
to use a third location which is then smb-mounted in both places, i.e. :

smb.conf: [homes] path=/smbshares/homedirs

server: mount smb:/homes /home

client: : mount smb:/homes /home

With this setup reparse-points are parsed correctly, both on the client 
and on server for the /home/<userA>/<more subdirs here> path.

- Kees.



