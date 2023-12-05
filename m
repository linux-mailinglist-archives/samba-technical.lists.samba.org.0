Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBEF80632A
	for <lists+samba-technical@lfdr.de>; Wed,  6 Dec 2023 01:06:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0yU3dr1huGD8ItoyIAJKlFQrhiElKLRDYkygTzXEmRw=; b=SxN18GDcQ4iKC/9ESgCqULZ6PR
	A0u7T9hw4siJJo9xYUXvJ9cuYcqc8MciFZ5R5E/HJMOEybfRWCihXr/gOe//uCuw8sUzs32UIQOfa
	MZg6w1PYJyyL3R4oF4C1e8COitsZfwgHrQFhCEgzgQKpCZGMip8JNOVJZbcA827e8quxUpOI54qQj
	veMqoqWL+JzERbm6krp5B7udeFJuQH30CRlQK+p7OoYE5xn2ESfKTmbsYSnUNIBOoI7FUy5NSgnOT
	Oic/cAzixeerh1eFmUZ0L9TI3g2Eg5sQiDdPHivO9BLoSTVokwNPFj/CkXYiAv9tFrXHovMTzCJMV
	+HgzJbaQ==;
Received: from ip6-localhost ([::1]:30550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rAfQX-004Xx3-Fj; Wed, 06 Dec 2023 00:06:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75]:47738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rAfQS-004Xwt-Gf
 for samba-technical@lists.samba.org; Wed, 06 Dec 2023 00:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 46556B81A62
 for <samba-technical@lists.samba.org>; Tue,  5 Dec 2023 23:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B483C433C7
 for <samba-technical@lists.samba.org>; Tue,  5 Dec 2023 23:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701820083;
 bh=5haMR6z10LwAOwz3Tsgh9GHuu+CZhIvtF+q3fYjk5Oc=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=JDjsQFKSdDZ3KN5McafVlUhX4zob3BuFxFNTUM7tEW/39sUeJZY47zbqnzsNsguZN
 tsV5sMN5cRS8YG11g7zG6XjLMPJeWWMztDtLsU538zKAHE7UxPuQGx1WvNr4oSA/SD
 HMPTn3sj3zot0WbBcaE5hy6vt3SW4UwuWjfVgmDxeP+A0qvHKEbN8TCyuBki5cZwJ3
 EIVpjcsS/Nj2yQayPZ9IoWqKN8PVDS3yL4Oy5oFf8ThWalb+wYOKZOuKwDBrpLqzKT
 UYxz8jMPaVpUIm87F4NvfpqmFi/mQB320yUrXN6BwSH5N9MiVTSCk3VE09k/zM/VC8
 dKHtMf9+8ep7Q==
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-1fb4ee3d548so1403430fac.2
 for <samba-technical@lists.samba.org>; Tue, 05 Dec 2023 15:48:03 -0800 (PST)
X-Gm-Message-State: AOJu0YyBJ1sshpG9PkSFGBRmUl06dshZyPnXDVWlcgrKEQ6BuwLe2Gzg
 OW53U4wvv0MDUT9P+jCsFB8nTrmxP1+hURJrvPs=
X-Google-Smtp-Source: AGHT+IGLUX8l5j/S/fZgLsr0lFIdYu0vrQ/Oo28txNFc1zOl3DhBkxBJGMHYVqofCO+o/yKrZSN+AwBKhd31fzPT0Qc=
X-Received: by 2002:a05:6870:8e0c:b0:1fb:75a:de69 with SMTP id
 lw12-20020a0568708e0c00b001fb075ade69mr9264911oab.87.1701820082923; Tue, 05
 Dec 2023 15:48:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:5a85:0:b0:507:5de0:116e with HTTP; Tue, 5 Dec 2023
 15:48:02 -0800 (PST)
In-Reply-To: <e20433c2-82e8-41e0-aa29-279dd64996fc@samba.org>
References: <CAKYAXd9-61f1cjXMrovSEdio8fuTSbegfde4FZ9m1DAAS+CxRg@mail.gmail.com>
 <e20433c2-82e8-41e0-aa29-279dd64996fc@samba.org>
Date: Wed, 6 Dec 2023 08:48:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_m2OTmh_DyYSULXiMDPNzG-mWZRhB4oZXsCZ6saaTdrg@mail.gmail.com>
Message-ID: <CAKYAXd_m2OTmh_DyYSULXiMDPNzG-mWZRhB4oZXsCZ6saaTdrg@mail.gmail.com>
Subject: Re: Name string of SMB2_CREATE_ALLOCATION_SIZE is AlSi or AISi ?
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Interoperability Documentation Help <dochelp@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2023-12-05 19:01 GMT+09:00, Ralph Boehme <slow@samba.org>:
> On 12/5/23 08:48, Namjae Jeon via samba-technical wrote:
>> I found that name strings of SMB2_CREATE_ALLOCATION_SIZE are different
>> between samba and cifs/ksmbd like the following. In the MS-SMB2
>> specification, the name of SMB2_CREATE_ALLOCATION_SIZE is defined as
>> AISi.
>> Is it a typo in the specification or is samba defining it incorrectly?
>>
>> samba-4.19.2/libcli/smb/smb2_constants.h :
>> #define SMB2_CREATE_TAG_ALSI "AlSi"
>>
>> /fs/smb/common/smb2pdu.h :
>> #define SMB2_CREATE_ALLOCATION_SIZE             "AISi"
>
> looks like a bug in MS-SMB2: they have the value as 0x416c5369, which is
> "AlSi", with an "l" like in "l"ake.
I will fix it in common header of cifs/ksmbd.
Thanks for your check!

>
> Adding dochelp to cc.
>
> @dochelp: looks like you have a small bug in MS-SMB2. :)
>
> -slow
>

