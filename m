Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE9114E20
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 10:27:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=iDmdhLO0rC4OCNR9PJSklSszmVuna2Ul4WEO85qNWv4=; b=H1hSzXmZ44wyRp36DD/df8L57g
	QqN4DkyclKMvCAhbqmc8uzOO0h5bz0GfQdXJWiArcQk4CdTPALgWvYJqvi5lDiCTnSdNAkDFCUUDX
	tSQtg4zotdJSuCaDPFPAyguFi6DbH+f0d3auZJz4I6PMctHjESaZqD2PtdcCXCNr0es42JYVA+zz+
	ZtBgpnsm90fOCqTDtB174pLhOgWgJffuM6oLsTZNhn9T4/yMyrvTR/5CngetZY0atsqeklkFhP/Ga
	BJVYVdMTeZghZRECxipEp//39upIvr32XwiWclKLikC4a0UFkXCiMuHW9zAk/7mcqstV9EOIEwkh5
	0CHobrJg==;
Received: from localhost ([::1]:18840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1id9sk-006OUy-7K; Fri, 06 Dec 2019 09:26:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51174) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1id9sf-006OUq-6M
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 09:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=iDmdhLO0rC4OCNR9PJSklSszmVuna2Ul4WEO85qNWv4=; b=E3+b7pcAbgjUN7VqXsbFPrW9QA
 gIlTyUQj/wjWSIoFYye32AflBdgbaOycT5H4TPsG4XI6lkbcPDGk1bTH1tVvTwrgBwlsQWSy+TMyd
 B9f9nFAHuOKP9aRXMsGB0f4VxBBO0cFUa3qLkDtjSp/Bd11OB2ZQqwsIQN2wNa5aT1rNMSU/KlQjT
 bevDdfhAHf0Dz6SL/rK18N0th23YnaF9O4oPmidKaLKifgn+OGXzdk3bbGKS/Ew5STQTfG2N4FQJA
 7T7XaYqMXPnCS1UBYEaRjx6RP7uSfw2YxUKLz23EDD+bujSM6ipUSXLFOjSbhatkcxBjdz9WSjGn1
 9PUp9GgPFM+kGSjiy4VHLeXb/xbpRYwBeIkS35YBwufkIH9IWOn4+zYxtW7GeF45WKzo80Nzhs1CZ
 DaJXuE9wm1rQTjKYZNB0rVF3Bez7LUzegzmXF7/9tL7mAvk/0Lz16EXAgH4gEeVWJMgvXAoTdbyWK
 dCF3lZ3huq6z1taAIO/Wlmsf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1id9se-0006VX-Tf
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 09:26:33 +0000
To: <samba-technical@lists.samba.org>
References: <5f6a93e3-ff99-6a5e-9465-9249bbd8aeb4@suse.com>
 <4B983F292AE847D2B13D20B8B693833C@rotterdam.bazuin.nl>
 <22a199fa-1f25-ee46-03b5-5b2bfd130234@samba.org>
In-Reply-To: <22a199fa-1f25-ee46-03b5-5b2bfd130234@samba.org>
Subject: RE: creating certificates for dc, user etc for samba tests
Date: Fri, 6 Dec 2019 10:26:33 +0100
Message-ID: <2CDF14C89900408E89747F08BE359F61@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AdWsFonks3h6ODgbQpa7eSS9yxCCPQAADVyw
X-MimeOLE: Produced By Microsoft MimeOLE
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

As far i can tell there solution is to make 2 config for openssl.=20

https://github.com/PADL/heimdal/commit/d26daefd4ae35ef7448f8b3e7fba895b0f=
901
bd7=20

shows
data/openssl.cnf.1.0 \
data/openssl.cnf.1.1 \=20
> workaround until openssl -objects lands <=20

And=20
https://github.com/PADL/heimdal/commit/d26daefd4ae35ef7448f8b3e7fba895b0f=
901
bd7#diff-71fc8c9f169ce490db429f9031aee4fa=20

Shows the example openssl1.1.cnf
You could compair this one with the one your using atm.=20

What is the os your using and openssl version?=20


Greetz,

Louis



> -----Oorspronkelijk bericht-----
> Van: npower [mailto:npower@samba.org]=20
> Verzonden: vrijdag 6 december 2019 10:21
> Aan: belle@samba.org; samba-team@lists.samba.org
> Onderwerp: Re: creating certificates for dc, user etc for samba tests
>=20
> hmm, I thought I sent this to samba-technical... damn=20
> autocompletion :-)
>=20
> On 06/12/2019 08:47, L. van Belle via samba-team wrote:
> > Which openssl version?=20
> 1.1.0
> >
> > You might be hitting these bugs.=20
> > https://github.com/openssl/openssl/issues/6696=20
> > https://github.com/heimdal/heimdal/issues/392=20
>=20
> yes, I had seen those and while they describe somewhat the situation I
> don't see a solution, I tried commenting out those entries and get
> similar results as described in =A0
> https://github.com/openssl/openssl/issues/6696
>=20
> if there is a solution in the report there I didn't see it, my plan B
> was to dig out an old system with older openssl. Be good though if
> someone who knows about this can either fix the config files or update
> the instructions or... :-)
>=20
> Anyway thanks
>=20
> Noel
>=20
> >
> >
> > Greetz,=20
> >
> > Louis
> >
> >
> >> -----Oorspronkelijk bericht-----
> >> Van: samba-technical=20
> >> [mailto:samba-technical-bounces@lists.samba.org] Namens Noel=20
> >> Power via samba-technical
> >> Verzonden: vrijdag 6 december 2019 9:15
> >> Aan: samba-technical
> >> Onderwerp: creating certificates for dc, user etc for samba tests
> >>
> >> Help!!
> >>
> >> Does anyone know anything about openssl & generating certs ?
> >>
> >> I tried to follow the instructions at
> >> selftest/manage-ca/manage-CA-samba.example.com.sh
> >>
> >> e.g.
> >>
> >> =A0 ./manage-ca.sh manage-CA-samba.example.com.cnf create_dc
> >> testdc.samba.example.com 0123456789ABCDEF
> >>
> >> =A0 problem creating object scardLogin=3D1.3.6.1.4.1.311.20.2.2
> >>
> >> =A0 140087403947840:error:08064066:object identifier
> >> routines:OBJ_create:oid exists:crypto/objects/obj_dat.c:708:
> >>
> >> some google results seemed to indicate this error results=20
> from changes
> >> in openssl where some attributes are now included by default=20
> >> (iiuc) so I
> >> commented out that attribute in
> >> manage-ca.templates.d/openssl-BASE-template.cnf
> >>
> >> then the same error for msUPN & msKDC (so I did the same)
> >>
> >> the process gets further but error out with
> >>
> >> Using configuration from
> >> CA-samba.example.com/DCs/testdc.samba.example.com/DC-testdc.sa
> >> mba.example.com-S06-openssl.cnf
> >> Enter pass phrase for
> >> CA-samba.example.com/Private/CA-samba.example.com-private-key.pem:
> >> Error Loading extension section template_x509_extensions
> >> 140189838030656:error:0E06D06C:configuration file
> >> routines:NCONF_get_string:no
> >> value:crypto/conf/conf_lib.c:275:group=3DCA_default =
name=3Demail_in_dn
> >> 140189838030656:error:0D06407A:asn1 encoding
> >> routines:a2d_ASN1_OBJECT:first num too=20
> >> large:crypto/asn1/a_object.c:72:
> >> 140189838030656:error:2206706E:X509 V3
> >> routines:v2i_EXTENDED_KEY_USAGE:invalid object
> >> identifier:crypto/x509v3/v3_extku.c:93:section:,name:msKDC,value:
> >> 140189838030656:error:22098080:X509 V3=20
> routines:X509V3_EXT_nconf:error
> >> in extension:crypto/x509v3/v3_conf.c:47:name=3DextendedKeyUsage,
> >> value=3DclientAuth,serverAuth,msKDC
> >>
> >> so I am stumpted as I am totally clueless about these=20
> files and their
> >> content, there seems plenty of google hits about similar=20
> errors but I
> >> don't know enough to interpret them, can anyone help ??
> >>
> >> Noel
> >>
> >>
> >>
> >
>=20


