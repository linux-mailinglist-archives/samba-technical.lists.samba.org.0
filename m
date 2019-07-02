Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E15D1D6
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 16:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Oxjk5J3DkiV5xHIvEgKAJhBNzWX+aPcNsGmtwXqvQ+0=; b=UwMdjtsFoOJGADfdqKAWmHFSf0
	j8h2lmwU+JNi1ZBurepdMJJrL8soZULJFDWTNuDYRp7YyJSM+OUUeNdkckvoYJRpjDJ6m25YGF03d
	5cre78IM1ifqj3CWRPAyh3FPlG0mvMmNd0A4jvN6q4b01edaCF/fY8cG9Pd/pB6qj241Wp2YEomzi
	6Ux4/Wq4C5iUxYCxUwyfIngSe3jDHhFgfmpyxdzuea9F3CwKPZS9PWc/0T7HaQfIR+WTSSuOfULuj
	Eu9PpbJACB5Tef7nhV0BzfuksGRG+ux51wGdQOcUbajkslMQyVxwHeKUrJ2qcI1MSIzTX8Sxanfjn
	xaKwYh9Q==;
Received: from localhost ([::1]:48832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiJt9-004bD1-DI; Tue, 02 Jul 2019 14:36:07 +0000
Received: from mx2.suse.de ([195.135.220.15]:48888 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hiJt4-004bAN-Nr
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 14:36:06 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CD63B918;
 Tue,  2 Jul 2019 14:35:54 +0000 (UTC)
To: P Mairo <akoudanilo@gmail.com>,
 P Mairo via samba-technical <samba-technical@lists.samba.org>
Subject: Re: GSOC 2019 : Improve smbcmp - Best format to use for diffs
In-Reply-To: <CAELK94fFcDARR01muXi_R429VgL744x=9cYB7c+bnRgjuPYE=A@mail.gmail.com>
References: <CAELK94fFcDARR01muXi_R429VgL744x=9cYB7c+bnRgjuPYE=A@mail.gmail.com>
Date: Tue, 02 Jul 2019 16:35:52 +0200
Message-ID: <87d0iszepj.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

"P Mairo via samba-technical" <samba-technical@lists.samba.org> writes:
> Hello,
> Yesterday I discovered the json output of Tshark and as I have to impleme=
nt
> better diffs, I thought why not?
> So looking at it more closely today, I realized that it would be more
> appropriate because all the irrelevant fields we discussed about previous=
ly
> are automatically removed and the data structure is convenient for
> navigation.
> As a sum up, I want to deviate a little bit from the initial plan (use XM=
L)
> to reach the same goal (better diffs).
> What are your insights on this?

I've had a quick look and I see a couple of problems with the JSON
output(s):

* Using -T json (sample)

        "smb2": {
          "SMB2 Header": {
            "smb2.server_component_smb2": "",
            "smb2.header_len": "64",
            "smb2.credit.charge": "0",
            "smb2.channel_sequence": "0",
            "smb2.reserved": "00:00",
            "smb2.cmd": "0",
            "smb2.credits.requested": "2",
            "smb2.flags": "0x00000000",
            "smb2.flags_tree": {
              "smb2.flags.response": "0",
              "smb2.flags.async": "0",
              "smb2.flags.chained": "0",
              "smb2.flags.signature": "0",
              "smb2.flags.priority_mask": "0",
              "smb2.flags.dfs": "0",
              "smb2.flags.replay": "0"
            },

- No summary lines

You will need to use some other ouput for them. PDML doesnt have it
either which is why we also need PSML.

- No human readable field name and description

It uses the field abbreviated names but we want the human readable
ones. e.g.

    "smb2.negotiate_context.hash_algorithm": "0x00000001",

vs

    <field name=3D"smb2.negotiate_context.hash_algorithm"
           showname=3D"HashAlgorithm: SHA-512 (0x0001)" <----- this
           size=3D"2" pos=3D"186" show=3D"0x00000001" value=3D"0100"/>


- JSON dictionnary entries are not ordered

e.g. if you parse

{"foo":"0", "bar":"1"}

And try to dump it again, depending the implementation you cannot
guarantee "foo" will be printed before "bar". In python it seems [1] you
can tell the parser to use OrderedDict as the underlying storage so this
might be doable.

I've also looked at the other json output format "ek" and "jsonraw" but
the same limitations apply unfortunately.

1: https://stackoverflow.com/questions/6921699/can-i-get-json-to-load-into-=
an-ordereddict

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Linux GmbH, Maxfeldstra=C3=9Fe 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=BCr=
nberg)

