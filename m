Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104E5E202
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2019 12:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yNs8/vgtTA7/yvZjFpoIH7ynNAkCEhZVaGEBr5LJWV8=; b=ThGPpcDqpPDAa1lJbRlKURbkDa
	3tLwgGi+k4ja9PdedeN16aoL/loR8oZ7LvMXskIaQAttLmJWmBGslnqpL02JVP87gkoHg2Ilhhs3p
	8nklVxpjQf1HygSuvOHzSGHQemrXgue1fn7qYo6wyBHqkT+P1EV5x8xE0rKvxtDzcYflPPz1u8k2c
	LlApi2CrYd5jbimm6C5+q28HrJHzqtyN7PLyGKXNcsXdq6CrENcBbS5ZGACzPu2jgWoU0HSFkPyzW
	CfRumf2XTsCyCLYpDsTKHDWH9xHNs4mk+K8LJg2A5TjcPhaBQqp2cYlqD2Pmk/BckQCetbGxhIO6A
	/zj8Ic0w==;
Received: from localhost ([::1]:50130 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hicQy-004qiH-7k; Wed, 03 Jul 2019 10:24:16 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:43604) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hicQt-004qiA-N9
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 10:24:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id j29so1367703lfk.10
 for <samba-technical@lists.samba.org>; Wed, 03 Jul 2019 03:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DFXFJP/q16emOiXqwDO29jNdQgnWxmXpdKfQOgRtPh0=;
 b=OLn+0VLtIAWL0zafAelMMMfI/DcGyXdYlRpCnLhrvfw0149YckdUYNEjad5g4zfBhD
 Kf/3Vk7xKz9fba22SdK6NtF9dEpKZvxqQlBYLDdBXJgE+c3xd6xvO+S68aNtDEw3on1C
 gs8674ujnexgd+b5Zn/WHpcPU245ovFF1Ci826E+/145aG8RWUQQ+aOqHuWnwLTCxzU6
 QX/FfSGnCfwdcgtlbAJl0diZMCNp3vm/QyEW99lnEpF8a97H1pt50EHXn+JL4gGPdbxt
 Z5xHpoM1ftnG2K3yuooVfPrHDhIynJXsaJJrD9b83WCN8Dk/c03bxg4jhpZbNWASKC7V
 SXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DFXFJP/q16emOiXqwDO29jNdQgnWxmXpdKfQOgRtPh0=;
 b=GhsObbTA7dM78aDgJRlt8wUCyzBufzvRmkGk4lXgsbfJWvVECiHW1LWm0yF3Dwpexn
 Q9WIkDNo+JkTSsweaEQrXGUmssIePAah8OEiA9JEKTILNJYkSDOto3rJmIM9DoQ+j23s
 mDKc5ry9BZCjBz26dqHNMn5wi9Z1gq7ZS4hBxpF8DU0SeZ1rKysEzXeRfPuKt7djWl2J
 CwGOEOTSWGTHgOh4XkJDg6DVKyh0ZYXjLy2THsII3cPqyHYLc++CgSbQseZP9gJnkEuN
 oX1gSgfGqYtuxmYiFNVzZozAaW9eyGQihqwRi2WR6buVUPVt2Oux2L0smryv4piK9+Ib
 DMpw==
X-Gm-Message-State: APjAAAWvZjGgdjf+EMTNmLmulGHOoLlx1lqa0Ych0ZhyY2kFZHQFG5y/
 HepHvb+mRdyNvboQ2uWWTZWovTaQh9KnWnzAXFSEXNo9Y0o=
X-Google-Smtp-Source: APXvYqyJNqXo44T9xi3Jdz+v+HQhMOYDaTEarJLKeoaMEEgUlf3NZXHSLU7v01e8IGC8c4mR9LEu+G8pd7JNl7yVrl8=
X-Received: by 2002:ac2:46f9:: with SMTP id q25mr19015467lfo.181.1562149450231; 
 Wed, 03 Jul 2019 03:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAELK94fFcDARR01muXi_R429VgL744x=9cYB7c+bnRgjuPYE=A@mail.gmail.com>
 <87d0iszepj.fsf@suse.com>
In-Reply-To: <87d0iszepj.fsf@suse.com>
Date: Wed, 3 Jul 2019 11:23:58 +0100
Message-ID: <CAELK94ehv5SW+Jsx20fNUs5SNuZ7DeUSSBGXegqpU5zc9LAN7Q@mail.gmail.com>
Subject: Re: GSOC 2019 : Improve smbcmp - Best format to use for diffs
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Cc: P Mairo via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for the feedback,
While you raise major problems that json don't address, mainly the no human
readable field part, I may add that it seems like the OrderedDict is not
relevant anymore since python 3.6 [1] because order is implemented by
default

1:
https://www.reddit.com/r/Python/comments/51te8x/raymond_hettingerpython36_n=
ews_ordereddict_is/

regards.

Le mar. 2 juil. 2019 =C3=A0 15:35, Aur=C3=A9lien Aptel <aaptel@suse.com> a =
=C3=A9crit :

> "P Mairo via samba-technical" <samba-technical@lists.samba.org> writes:
> > Hello,
> > Yesterday I discovered the json output of Tshark and as I have to
> implement
> > better diffs, I thought why not?
> > So looking at it more closely today, I realized that it would be more
> > appropriate because all the irrelevant fields we discussed about
> previously
> > are automatically removed and the data structure is convenient for
> > navigation.
> > As a sum up, I want to deviate a little bit from the initial plan (use
> XML)
> > to reach the same goal (better diffs).
> > What are your insights on this?
>
> I've had a quick look and I see a couple of problems with the JSON
> output(s):
>
> * Using -T json (sample)
>
>         "smb2": {
>           "SMB2 Header": {
>             "smb2.server_component_smb2": "",
>             "smb2.header_len": "64",
>             "smb2.credit.charge": "0",
>             "smb2.channel_sequence": "0",
>             "smb2.reserved": "00:00",
>             "smb2.cmd": "0",
>             "smb2.credits.requested": "2",
>             "smb2.flags": "0x00000000",
>             "smb2.flags_tree": {
>               "smb2.flags.response": "0",
>               "smb2.flags.async": "0",
>               "smb2.flags.chained": "0",
>               "smb2.flags.signature": "0",
>               "smb2.flags.priority_mask": "0",
>               "smb2.flags.dfs": "0",
>               "smb2.flags.replay": "0"
>             },
>
> - No summary lines
>
> You will need to use some other ouput for them. PDML doesnt have it
> either which is why we also need PSML.
>
> - No human readable field name and description
>
> It uses the field abbreviated names but we want the human readable
> ones. e.g.
>
>     "smb2.negotiate_context.hash_algorithm": "0x00000001",
>
> vs
>
>     <field name=3D"smb2.negotiate_context.hash_algorithm"
>            showname=3D"HashAlgorithm: SHA-512 (0x0001)" <----- this
>            size=3D"2" pos=3D"186" show=3D"0x00000001" value=3D"0100"/>
>
>
> - JSON dictionnary entries are not ordered
>
> e.g. if you parse
>
> {"foo":"0", "bar":"1"}
>
> And try to dump it again, depending the implementation you cannot
> guarantee "foo" will be printed before "bar". In python it seems [1] you
> can tell the parser to use OrderedDict as the underlying storage so this
> might be doable.
>
> I've also looked at the other json output format "ek" and "jsonraw" but
> the same limitations apply unfortunately.
>
> 1:
> https://stackoverflow.com/questions/6921699/can-i-get-json-to-load-into-a=
n-ordereddict
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Linux GmbH, Maxfeldstra=C3=9Fe 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=
=BCrnberg)
>


--=20
https://github.com/RMPR
