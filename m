Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C714547006A
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 13:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=drCNuU1fvm0AgZwY9kKEAGHORS7v5BXHiMQBUlkL7qU=; b=rJR30ZN4EaKg11LcoVLWHpshFo
	latD5HquwoBPW7fsuiOOtYHwoTHMsotu/Y1ELByvH3oqAhL7V434zkskHFvApiwzyIaFCKejZLAo5
	OSX1MbLKVsaJXEgV88XX4sRXJ12gufNOspOieTGrDu9R6OG8rggd3WQtKhgGcrL7EDvJUsINwZVHQ
	Crw6RIsgWMgRuAxk7ndN1kP/Qsyrb2G9CUpPASh1X0Wf0fcisn3jm3UDZpzMLemvNZBOa1Bd0D2tM
	D76Bw1pdcIhWK76gTReW1kJoCX6JW+OZpfB7wiWLDy8Op9BCeWn2O8j8IQDshpfZ4J3ZIkAAwl2BJ
	7PNOKPig==;
Received: from ip6-localhost ([::1]:57946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mveeW-004psD-5x; Fri, 10 Dec 2021 12:05:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mveeA-004prf-HR; Fri, 10 Dec 2021 12:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=drCNuU1fvm0AgZwY9kKEAGHORS7v5BXHiMQBUlkL7qU=; b=es972vzO9H7tEMVQLqducvj7kL
 Glk+Y+3YZ1ZOK803jiXhdSVOb8a/V2UaGxiHdQwxxRzfTaCSAktd2qZWrnNL3SkwEsW774Ok9xMqp
 XaPoNgr+it6FMKO0wUcR/sSNndmnmOMs7BAS3Hfz7dbqmU5S2o1V5RUjh2vHuE4uZecQ+OJGqrE25
 G4viSp5Yi6xMzwmNXdu60lnLCTzmnd1DGpMxbBcHNHtpj6xt/sQoBwRnOKr6LLsXZFQLS36C/kIoz
 fVwhImPgwGPU9tuH2fPBRuYlS3f50dF3G8spmuGJ0QZfQulniX/Rrh9TMA7QPXf+dv3JTZkn5K5nD
 OVRKpoeaa+Mf9ubBJGZp9wFaQsvDpONGGzdIEnFWRPLjMC6idgmZjnhJ2G6DP3n5tSkhXWTs8tRNg
 Iv4eC66xdtzxci+AXf109maX6jZbwgU4/w8AvUWsKGB0STQh3LJn8MqrtBDdrtOpEbde+6mPCMlnm
 b+/WVN/azChPeoCIup7gm8ul;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvee9-0029Xr-Jd; Fri, 10 Dec 2021 12:05:06 +0000
Message-ID: <e278caa18955a12bab70a1231dc815e364e546e1.camel@samba.org>
Subject: Fwd: CfP FOSDEM 22 Software Defined Storage
To: samba <samba@lists.samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Fri, 10 Dec 2021 17:35:02 +0530
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-8pa53MwlnADXEKqSoEk5"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-8pa53MwlnADXEKqSoEk5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Call for Participation is open for the Software Defined Storage Devroom
at FOSDEM. Samba talk proposals are welcome as always. Like the
previous edition, FOSDEM 2022 is also planned to be an online event
during the weekend of February 5./6. 2022. Please see below for
details..

----- Forwarded message from Jan Fajerski <lists@fajerski.name> -----

> From: Jan Fajerski <lists@fajerski.name>
> To: fosdem@lists.fosdem.org
> Date: Mon, 6 Dec 2021 10:03:56 +0100
> Subject: [FOSDEM] CfP FOSDEM 22 Software Defined Storage
>=20
> FOSDEM is a free software event that offers open source communities a
> place to
> meet, share ideas and collaborate.=C2=A0 It is well known for being highl=
y
> developer-oriented and in the past brought together 8000+
> participants from
> all over the world.=C2=A0 It's home is in the city of Brussels (Belgium).
>=20
> FOSDEM 2022 will take place as an online event during the weekend of
> February
> 5./6. 2022. More details about the event can be found at
> http://fosdem.org/
>=20
> ** Call For Participation
>=20
> The Software Defined Storage devroom will go into it's sixth round
> for talks
> around Open Source Software Defined Storage projects, management
> tools
> and real world deployments.
>=20
> Presentation topics could include but are not limited too:
>=20
> - Your work on a SDS project like Ceph, Gluster, OpenEBS, CORTX or
> Longhorn
>=20
> - Your work on or with SDS related projects like OpenStack SWIFT or
> Container
> Storage Interface
>=20
> - Management tools for SDS deployments
>=20
> - Monitoring tools for SDS clusters
>=20
> ** Important dates:
>=20
> - Jan=C2=A0 7th 2022:=C2=A0 submission deadline for talk proposals
> - Jan 14th 2022:=C2=A0 announcement of the final schedule
> - Feb=C2=A0 6th 2022:=C2=A0 Software Defined Storage dev room
>=20
> Talk proposals will be reviewed by a steering committee:
> - Niels de Vos (Red Hat)
> - Jan Fajerski (Red Hat)
> - TBD
>=20
> Use the FOSDEM 'pentabarf' tool to submit your proposal:
> https://penta.fosdem.org/submission/FOSDEM22
>=20
> - If necessary, create a Pentabarf account and activate it.
> Please reuse your account from previous years if you have
> already created it.
> https://penta.fosdem.org/user/new_account/FOSDEM22
>=20
> - In the "Person" section, provide First name, Last name
> (in the "General" tab), Email (in the "Contact" tab)
> and Bio ("Abstract" field in the "Description" tab).
>=20
> - Submit a proposal by clicking on "Create event".
>=20
> - If you plan to register your proposal in several tracks to increase
> your
> chances, don't! Register your talk once, in the most accurate track.
>=20
> - Presentations have to be pre-recorded before the event and will be
> streamed
> on=C2=A0=C2=A0 the event weekend.
>=20
> - Important! Select the "Software Defined Storage devroom" track
> (on the "General" tab).
>=20
> - Provide the title of your talk ("Event title" in the "General"
> tab).
>=20
> - Provide a description of the subject of the talk and the
> intended audience (in the "Abstract" field of the "Description" tab)
>=20
> - Provide a rough outline of the talk or goals of the session (a
> short
> list of bullet points covering topics that will be discussed) in the
> "Full description" field in the "Description" tab
>=20
> - Provide an expected length of your talk in the "Duration" field.
> =C2=A0 We suggest a length between 15 and 45 minutes.
>=20
> ** For accepted talks
>=20
> Once your proposal is accepted we will assign you a volunteer deputy
> who will
> help you to produce the talk recording.=C2=A0 The volunteer will also try
> to ensure
> the recording is of good quality, help with uploading it to the
> system,
> broadcasting it during the event and moderate the Q&A session after
> the
> broadcast.=C2=A0 Please note that as a presenter you're expected to be
> available
> online during and especially after the broadcast of you talk.=C2=A0 The
> schedule
> will be available under
> https://fosdem.org/2022/schedule/track/software_defined_storage/
>=20
> Hope to hear from you soon! And please forward this announcement.
>=20
> If you have any further questions, please write to the mailing list
> at
> storage-devroom@lists.fosdem.org
> (https://lists.fosdem.org/listinfo/storage-devroom)
> and we will try to answer as soon as possible.
>=20
> Thanks!
> _______________________________________________
> FOSDEM mailing list
> FOSDEM@lists.fosdem.org
> https://lists.fosdem.org/listinfo/fosdem

----- End forwarded message -----


--=-8pa53MwlnADXEKqSoEk5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJGBAABCAAwFiEEnT5D0VvJca0Yosn7HqEKkqddPRoFAmGzQm4SHGFub29wY3NA
c2FtYmEub3JnAAoJEB6hCpKnXT0aBtUP/i5L49EPSyeAcfZknu4Y7gfdZ08RK7Io
JwYP52lZA+2KZRlj0zv+bgis7XSFPMV6mv4M4BKfhjHhXEPhHBrTIFe/dH6JA1qT
5R+WKvDfDpeDFGBnj5CEr+VXXnTdZgA2oc2OBmnKQiR3UlGSbNVlqTMlAsYt9QZS
u1lnmcHODSBntoDcVJGlRh1W+toKlrMdvrTysALZ97hDaehsrXtr26h69mYrSYQa
ywiQv2W9nKN9y70YQlZ6yz6lsTF+kBLS2uFZLwdgWX02HxWYPG0e3z94J6jES0H3
L7gsyHvURCsHbLnDcGYSa0J2NXSCQSrs2GgPCCDKu8C0aesMZ2Qhmk8eO7rTr8jP
SdOK0Uvo7oLDFysoMp76Q95KTBOrHvPdONgL6Omf2d7FV2jCeXpMKiMHGYZSqm3m
6vQks3vqpiytONFlb/RSZBh6+Hl6ZMWgSYISbqz+WwynQGAB1dvgiNTx+C05FR6W
FIET0B5t16NMmP2RHfsK3B7iOWZ7sGufiISa2Z5/YOIrnCuA6tIZrmG9bU6rEYkb
A6M+EMIHdPGpWMgkB90MQVCuTFwQ4w/N1Pzp/Gv7deypOcIpfuABxLRVw+Xs/nqg
rLtUAlqLnGnLPJHFO3/ytNYmayOJow1fElYgYVnFpd4TeyGxbuh0J64qoWZOthj0
NY/OwtunsYrX
=UiAx
-----END PGP SIGNATURE-----

--=-8pa53MwlnADXEKqSoEk5--

