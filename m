Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3B6A187F4
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 23:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=k/CRnWb3Epuzaia2eiKkMRKL8l52scRfqWpguyNY92s=; b=c1/b3NeCEwF/736M6/IyK+7550
	YA4fNjaOvFyR849TrTp3DapcmIF3ZtYmkyHjpU+3sBMPsJnuSzTWvKjb2Ii8Acrl2eQIfmo1XSVl9
	JS1CfXPt0ySpv3kDCcfWXzemfRC5zEEcXNs/zQLgfViox5KXZEyx0itjf9Hk22EghsgxV2tIPxoKS
	QKesVv4bL2+JVCDDXwz4lYKckOp3dCAvs9uDO2Z3KbobxNjLleKgTDYVVDgV67232PAycgxMWKGI0
	7XZPHWSzmQ5C5zt2oyx55XJFFWQE9L3rEjFT/BU+EMY9T/nWJh2FD4hSM9G5QbY5smpCPmJrMHuuc
	W4F+xEGw==;
Received: from ip6-localhost ([::1]:26208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1taNAv-0090m1-Pf; Tue, 21 Jan 2025 22:56:49 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:42257) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taNAq-0090lu-Jq
 for samba-technical@lists.samba.org; Tue, 21 Jan 2025 22:56:47 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so334123e87.1
 for <samba-technical@lists.samba.org>; Tue, 21 Jan 2025 14:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737500202; x=1738105002; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/CRnWb3Epuzaia2eiKkMRKL8l52scRfqWpguyNY92s=;
 b=QeLlf1fVpaFn+8Xu4WOoyKnZW75yjIODvTC7GXA8HNmriS3maO0cpuNMcf68Jh7ei0
 /gAIT3GTmBfDi2m7iX8SfRSLd/CbVhQnTK6fyZEUWeRYHy3gfbQQ21ioaVxXc/fePGZQ
 nS+fiJ4TN3hQheBfhg/IcrRZjNcvnnA+xh2N8DgtAUA3ARqjFh9rQ2TzbaA7L1N/Mr/F
 Z7l/CoC9B0o0SJTibczKCdc+Kik+T9EbQsIGFz6r/QjV2ZaSksCFsa7crj7ZIfxy45oA
 i4v5Hg1wjzHAQlpnEIag6c10vXntAH5E+bf9q5hVMjZWszzWLp3JsVJxzsoEtGsngoni
 uzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737500202; x=1738105002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/CRnWb3Epuzaia2eiKkMRKL8l52scRfqWpguyNY92s=;
 b=Y3A9PwVEj3uL3Z47BT3aPK50OGPpuTnZjJVIc8nMOUYnPCPXjzF4wuRkGSoHvv9zMH
 lH89v/SFjz/HCD8KdArxMH6Suwl10QgH5iewcM7Gk+KNOrHplX53SQI18Us6dvPPCCI4
 q3obHAGetEsuHtgogAK2qCih8+KmmP5f/DNEpHYQp4Y54rexL/oWQHoR0O5DnLhT8G+f
 3ZxhEKLnL+fuNU1FQ8VpUZaTJmAOTqSVs6HSGYypbyyjIsInXTMZk+tdJ/PVk4SVdZDh
 nTCxvG+lm95uzySzTL3uGX4zQQXqUHxm79nJllk/D5NFswSyrBKqOfNxTE8wcSTtnhKt
 UBpw==
X-Gm-Message-State: AOJu0Yw/bz0Xn7PYxbQ2W97KE/yHedUXHQwaiiq/HAHC0PMNe4RYmhaI
 2yHBAfhD19zNxFBPk9QipeqaTSIhbB7uFzvwW4BNJdPsv4Nb2cMETyHJ7mBmebPvsT1lPhMp0+0
 +cHLNCLpkW/96eJMjqUD7rg4SS0mz8YKB
X-Gm-Gg: ASbGncsaeF5Oh40yIWzbq4p8VEbWtFToNi4L9viLgYfDk7EdQuxF2HZV73Fluti64h6
 nyrhNZ/CTtpHW+9SCuQ7ISRqMWSHWzqNUF0IrFI1W/MAJs1pCQP4=
X-Google-Smtp-Source: AGHT+IF8pE/HLIlZ+N6tA1G6HSndqdmmMRYRWpbM2BCSiABOPU2NjusihhJnwsDnm8SAApqSWrS0JsraI8WLaR4YVS4=
X-Received: by 2002:a05:6512:3d8f:b0:540:2f87:c30c with SMTP id
 2adb3069b0e04-542abfb5ac4mr9070343e87.20.1737500202237; Tue, 21 Jan 2025
 14:56:42 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <4942506.OV4Wx5bFTl@magrathea>
 <CAH2r5mts9UoESoG-NMf8jWobVtd+ym+ujoHpxpVFf0CT2vwGWA@mail.gmail.com>
 <19764530.fSG56mABFh@magrathea>
In-Reply-To: <19764530.fSG56mABFh@magrathea>
Date: Tue, 21 Jan 2025 16:56:31 -0600
X-Gm-Features: AbW1kvbFcBnIEDQWBbLeDDWU5Y07CuEwpUzHUo1FPiVDwFW6qqwzTmiB3vp4Nhk
Message-ID: <CAH2r5mvUqNEy3q6TFC0v2+s9Wf3LtryK-EnYFO7=arYEGjH-jg@mail.gmail.com>
Subject: Re: Local KDC and Samba
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Alexander Bokovoy <ab@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks like the first thing the client has to do, is check if IAKERB is
supported and upcall for that case (not just

Currently no code in Linux (kernel) checks for this OID yet - but that
should be a simple change to upcall to your code for cases like IAKerb

../../../include/linux/oid_registry.h:  OID_IAKerb,
 /* 1.3.6.1.5.2.5 */

We will upcall if server reports the OID for kerberos or mskerberos:

int cifs_neg_token_init_mech_type(void *context, size_t hdrlen,
                                  unsigned char tag,
                                  const void *value, size_t vlen)
{
        struct TCP_Server_Info *server =3D context;
        enum OID oid;

        oid =3D look_up_OID(value, vlen);
        if (oid =3D=3D OID_mskrb5)
                server->sec_mskerberos =3D true;
        else if (oid =3D=3D OID_krb5u2u)
                server->sec_kerberosu2u =3D true;
        else if (oid =3D=3D OID_krb5)
                server->sec_kerberos =3D true;
        else if (oid =3D=3D OID_ntlmssp)
                server->sec_ntlmssp =3D true;
        else {
                char buf[50];

                sprint_oid(value, vlen, buf, sizeof(buf));
                cifs_dbg(FYI, "Decoding negTokenInit: unsupported OID %s\n"=
,
                         buf);
        }
        return 0;


enum securityEnum
cifs_select_sectype(struct TCP_Server_Info *server, enum securityEnum reque=
sted)
{
        switch (server->negflavor) {
        case CIFS_NEGFLAVOR_EXTENDED:
                switch (requested) {
                case Kerberos:
                case RawNTLMSSP:
                        return requested;
                case Unspecified:
                        if (server->sec_ntlmssp &&
                            (global_secflags & CIFSSEC_MAY_NTLMSSP))
                                return RawNTLMSSP;
                        if ((server->sec_kerberos || server->sec_mskerberos=
) &&
                            (global_secflags & CIFSSEC_MAY_KRB5))
                                return Kerberos;
                        fallthrough;
                default:
                        return Unspecified;
                }

On Tue, Jan 21, 2025 at 2:30=E2=80=AFAM Andreas Schneider <asn@samba.org> w=
rote:
>
> On Tuesday, 21 January 2025 06:59:25 CET Steve French wrote:
> > Do you have a sample wireshark trace of SMB3.1.1 connection to Samba
> > with the new peer-to-peer Kerbeors and/or IAKERB?
>
> Yes, I do. You can find it here:
>
> https://xor.cryptomilk.org/samba/iakerb/
>
> However that wont help you. See Alexander his reply. You need to use GSSA=
PI
> instead of raw Kerberos in cifs utils. You should try to do IAKerb first =
and
> fall back to KRB5 mech otherwise.
>
> What I haven't implemented yet. If we get a krbtgt via IAKerb we should a=
llow
> to store that in a user specified ccache or the default one.
>
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>


--=20
Thanks,

Steve

