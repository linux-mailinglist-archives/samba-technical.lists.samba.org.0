Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 865632DAEF8
	for <lists+samba-technical@lfdr.de>; Tue, 15 Dec 2020 15:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=F8dpg1WXtqdYlzSu3Vx3XElpB7irQiERNwxXj0xZh2Q=; b=elQhr8wP1zoh90bimdoi9/5FXu
	k1dslGGtiIIg2gjKoEKgu1OtrkqNVny8XbVBWjSUXXrVbYZPsRTG812bzGLhor1LsQxefMZ0n3agO
	2/Ud2y6dcrc7s3Z0dfN8K8gjz/Oz3poAaOpvG7CTA1itsHMhpJLnKdreK3ixF2fESvjiStmpO77is
	6iEZUhLv/4wrkBQAwFlLr8CfvGd9fm2Tk4cYyE1uupRWnM6v5tiNU+sF+DZvbwPFZttuYCPoPQ/Jm
	9FpPMRAX+UP2Tl5z+sRg7rNyk6jWV0ENbGqnxkCbpdj0O1ZdU8MKaKvQgRdmeW0mEI67rjGRLSYXt
	VkXGj2IQ==;
Received: from ip6-localhost ([::1]:31840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpBL0-001ONE-6s; Tue, 15 Dec 2020 14:30:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kpBKq-001ON7-8t
 for samba-technical@lists.samba.org; Tue, 15 Dec 2020 14:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=F8dpg1WXtqdYlzSu3Vx3XElpB7irQiERNwxXj0xZh2Q=; b=A7rb7r8q9O8qAd0cUvCgFo7ySY
 07HTOW45K6XjaUAwJ1Zn5/TB2ew4NVfdLDyaykZFnNULY+KToa/zbM9iRAZRoGdxvT/b6tssbKgJW
 dmRU2p1O/Gs+/0RIE5luinsiHAxfWk/l3l4Qp3rLfQmmxfgUoy2OV7fsUTVfQKnrLqAO1n5oxBMso
 CCl6HYOzxiq9r4SvjM3bOtY0/3avihKSTLn4UPGjUnH1aTqEdtPvqBfmrxkUL9V2I8Gb6nE0LyJ5M
 53PVj/cLT4fOFM88Ufn5nuqWXPRllSJPRcxNmiKih1ZaSTfjNOxBhJBO3CODBseMRYuxCEMCcFcQO
 rg00bQ19xDiIZlgBTDdhm4XJFrHA9vt4povIYNw/voHzrmNnsd2ojkLchHNNAedNu1CvkhOGW/2jw
 wCL8t2jVO1QgTeeqGcNTgj06Q1QLTZkhk7aM5k4Ym8dtaJfXPV2HfkrXgbjkUbdMfaNzpnM7Gvb3T
 CYLVyeF2wSRNQw4XWbFp0o4R;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kpBKZ-0005NI-OQ; Tue, 15 Dec 2020 14:29:35 +0000
To: Namjae Jeon <namjae.jeon@samsung.com>
References: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
 <CGME20201214182517epcas1p1d710746f4dd56097f16ed08cfda0f6b2@epcas1p1.samsung.com>
 <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
 <003a01d6d28a$00989dd0$01c9d970$@samsung.com>
Subject: Re: updated ksmbd (cifsd)
Message-ID: <069556fc-cb6c-1e52-02ab-fa9b71f58cf6@samba.org>
Date: Tue, 15 Dec 2020 15:29:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <003a01d6d28a$00989dd0$01c9d970$@samsung.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="J87LZvtrPesF5ZFGXizIBv4vTXOPn8zDt"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: 'CIFS' <linux-cifs@vger.kernel.org>,
 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>,
 'samba-technical' <samba-technical@lists.samba.org>,
 'Hyunchul Lee' <hyc.lee@gmail.com>, 'Steve French' <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J87LZvtrPesF5ZFGXizIBv4vTXOPn8zDt
Content-Type: multipart/mixed; boundary="y4U4WeUCyRD9FJl4DfRzngWd7fXLUnuLJ";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Namjae Jeon <namjae.jeon@samsung.com>
Cc: 'CIFS' <linux-cifs@vger.kernel.org>, 'Steve French' <smfrench@gmail.com>,
 'samba-technical' <samba-technical@lists.samba.org>,
 'Hyunchul Lee' <hyc.lee@gmail.com>,
 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>
Message-ID: <069556fc-cb6c-1e52-02ab-fa9b71f58cf6@samba.org>
Subject: Re: updated ksmbd (cifsd)
References: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
 <CGME20201214182517epcas1p1d710746f4dd56097f16ed08cfda0f6b2@epcas1p1.samsung.com>
 <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
 <003a01d6d28a$00989dd0$01c9d970$@samsung.com>
In-Reply-To: <003a01d6d28a$00989dd0$01c9d970$@samsung.com>

--y4U4WeUCyRD9FJl4DfRzngWd7fXLUnuLJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 15.12.20 um 03:28 schrieb Namjae Jeon via samba-technical:
> =20
>> I just looked briefly, but I'm wondering about a few things:
>>
>> 1. The xattr's to store additional meta data are not compatible with
>>    Samba's way of storing things:
>>     https://git.samba.org/?p=3Dsamba.git;a=3Dblob;f=3Dlibrpc/idl/xattr=
=2Eidl
>>
>>    In order to make it possible to use the same filesystem with both s=
ervers
>>    it would be great if the well established way used in Samba would b=
e used
>>    as well.
> Yes, Maybe... I will check it after sending ksmbd to linux-next.
> =20
>> 2. Why does smb2_set_info_sec() have fp->saccess |=3D FILE_SHARE_DELET=
E_LE; ?
> Because of smb2.acls.GENERIC failure.
>=20
> TESTING FILE GENERIC BITS
> get the original sd
> Testing generic bits 0x00000000
> time: 2020-12-15 00:00:37.940992
> failure: GENERIC [
> (../../source4/torture/smb2/acls.c:439) Incorrect status NT_STATUS_SHAR=
ING_VIOLATION - should be NT_STATUS_OK
>=20
> I really don't understand this test. This testcase expect that FILE_DEL=
ETE is set in response if desired access
> of smb2 open is FILE_MAXIMAL_ACCESS.
> I don't know why smb2 open should be allowed although FILE_SHARE_DELETE=
 is not set in previous open in this test.
> Can you give me a hint ?

As far as I can see the test assumes the user has SeRestorePrivilege, wit=
h that
SEC_FLAG_MAXIMUM_ALLOWED will add FILE_DELETE,
see https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-fsa/8=
ada5fbe-db4e-49fd-aef6-20d54b748e40

>> 3. Why does ksmbd_override_fsids() only reset cred->fs[g|u]id, but gro=
up_info
>>    is kept unchanged, I guess at least the groups array should be set =
to be empty.
> Yes, We need to handle the groups list. Will fix it.
>=20
>> 4. What is work->saved_cred_level used for in ksmbd_override_fsids()?
>>    It seems to be unused and adds a lot of complexity.
> ksmbd_override_fsids could be called recursively.
> work->saved_cred_level prevents ksmbd from overriding fs[g|u]id again.

But that will always be on the same session/share combination?

>> 5. Documentation/filesystems/cifsd.rst and fs/cifsd/Kconfig still refe=
rences https://github.com/cifsd-team/cifsd-tools
>>   instead of https://github.com/cifsd-team/ksmbd-tools
> Okay. Will update it.

Thanks!

>> 6. Why is SMB_SERVER_CHECK_CAP_NET_ADMIN an compile time option and wh=
y is it off by default?
>>    I think the behavior should be enforced without a switch.
> I can make it default yes. Can you explain more why it should be enforc=
ed ?

Why should an unprivileged user ever be able to start the server?
Wouldn't that be a massive security problem as that user would provide
the share definitions and users and controls what ksmbd_override_fsids() =
will use?

metze


--y4U4WeUCyRD9FJl4DfRzngWd7fXLUnuLJ--

--J87LZvtrPesF5ZFGXizIBv4vTXOPn8zDt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl/YyD8ACgkQDbX1YShp
vVZP8Q//deIyM6Ix3tBx9zXAuC5yWDwnH7/A91EbmfEU69gthwy4Lqj2Vf0kIK6G
oEGwp0cFcPcgQ7gak3cOnq+RiDYnDkrj4SS+nFo28N/fvweobTLluuk/tRQvtsuu
8gsoEBC8ETeQkAxpO9Mb19vI6opbpB4pNRNIr7YGY6MGNSIeTSIOTKQ6xx0Lw46N
qj/j3SWout85A+8DH9kX1FADfJtG52npgkAyGWjp1Sda+EuODnD/bbA5QuyI/If0
XcFyjDHQWsRYD4F/QT+VRxLvJdwqqrECPXDSIRNJuU2yL14Yum1UG4uzXsec/w7M
AOD+p8w45VMyq6fza2sdgg5xXpM4hzktAwX6nz52C9O0nr7PmqHb1vs8MMC+6g3V
IAljZSDb92pK1EYKsyl0YO5HNJ9y9Bq4iK7sr879LvGnjK9awS8Qmkd07FD8zcMJ
wXabLTgl0S1/MCjk0Fb9EqybW6mOXp7eVB3RWCxSwyKKDsFNY+L+igMO8Ouc9G0v
py5wf/w9agthYuyaAkiYpIJFNE1FxnWfsVDrXUw9zqcFiXu/+Y/EDa1mbNOWLFNM
4qtwcR4daiBqwjHFIrAdI+UpNyEWg6UN36gvTUW36i58/JHFbdz1pjlGDm+bl+RU
+szlRxlo9Mwvk/efc96oSK94+wmFAQPtYHQOurdDR6x/uuy3klY=
=OpmP
-----END PGP SIGNATURE-----

--J87LZvtrPesF5ZFGXizIBv4vTXOPn8zDt--

