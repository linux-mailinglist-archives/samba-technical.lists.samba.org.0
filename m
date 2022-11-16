Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185A62C35F
	for <lists+samba-technical@lfdr.de>; Wed, 16 Nov 2022 17:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=qxEHlpPfUdeM9Pr5Q2NDUzYGgm67HPKZmZVzTWeSffw=; b=D9+FabHbmo/8XSPjx3kH/0Zi3t
	BcXp9qhWg0QG21EIuGE1mUaYr9n4HTCJTKRz0TAoG4oIzeD2T2q34i3TOu9pY7Gzvu99eJXuSMvFt
	inH5dcvDpvSnW4H7LjmwHBMVqQvgVTwKJjO3J8ySFD7mEc1It5iMJLVFZVnd/lrRjJEnMQ4mq7c9j
	NTdxtZrfhwHjYpHHZifwuuMnEMexXdWm8JAe+mqkzlFtCNrjeRtjI9dS4fvmrGeH+eUYbfjiC6ZfI
	+BvyCFqZuRVhsV0Ngg3OKqRaOHBugZMknU8r/gmhV4SvR1PyuB+K0v5fu1/w4iMUgYgTxhJIc5Bvd
	vUCLBceg==;
Received: from ip6-localhost ([::1]:43534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ovKsa-00EQfd-5h; Wed, 16 Nov 2022 16:03:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23895) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ovKsT-00EQfT-Rd
 for samba-technical@lists.samba.org; Wed, 16 Nov 2022 16:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668614581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=qxEHlpPfUdeM9Pr5Q2NDUzYGgm67HPKZmZVzTWeSffw=;
 b=dMz5uxXgYcVOsuP6fPbUfLo61BYF3nnlvTE9eLfV2ZjZVhjDrbq5VjyW5wWp6q4iiKuIiz
 cHmlBD8411Fjy8+YI9SiFEY6/dwUAm3JXXwLmbtLzGxUbik6Wk/Hrq6MHJHZ9z5WkXCBKw
 VzCpMaij1RTXvmjUyoll4ZoUeXYiypk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668614582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=qxEHlpPfUdeM9Pr5Q2NDUzYGgm67HPKZmZVzTWeSffw=;
 b=aaX6mffN4e8S/JMU6f8g1nLO76I/u2estboxUdEjP6BwfvMssh749YhSaoQgZQ3NI+d4wW
 Nb0FUOpeBoqhrBl7N5hhec3AOiMfXLYIhoV5LDkSJ46daGyqrnUSkxsmrcNd99txgPxwRj
 HSpbN+Yi3IbAd30jeXk8RASSEodLe3Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-Dc8PRMAvNzKWrankfJ0_Ag-1; Wed, 16 Nov 2022 10:46:32 -0500
X-MC-Unique: Dc8PRMAvNzKWrankfJ0_Ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 448E63C11EA2
 for <samba-technical@lists.samba.org>; Wed, 16 Nov 2022 15:46:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA8D240C835A
 for <samba-technical@lists.samba.org>; Wed, 16 Nov 2022 15:46:31 +0000 (UTC)
Date: Wed, 16 Nov 2022 16:46:28 +0100
To: samba-technical@lists.samba.org
Subject: Fwd: [FOSDEM] CfP Software Defined Storage devroom FOSDEM23
Message-ID: <Y3UF1CyBWG1Qq06X@ndevos-x1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TYZdRhObIo8E0xxD"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
From: Niels de Vos via samba-technical <samba-technical@lists.samba.org>
Reply-To: Niels de Vos <ndevos@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--TYZdRhObIo8E0xxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

In a few montsh time FOSDEM will host an in-person Software Defined
Storage devroom again. It would be a great oppertunity to show what the
Samba project has been doing, and what is planned for the future.
Please consider proposing a talk!

Thanks,
Niels


----- Forwarded message from Jan Fajerski <jan@fajerski.name> -----

> From: Jan Fajerski <jan@fajerski.name>
> To: fosdem@lists.fosdem.org
> Cc: devroom-managers@lists.fosdem.org
> Date: Thu, 10 Nov 2022 10:49:51 +0100
> Subject: [FOSDEM] CfP Software Defined Storage devroom FOSDEM23
>=20
> FOSDEM is a free software event that offers open source communities a pla=
ce to
> meet, share ideas and collaborate.  It is well known for being highly
> developer-oriented and in the past brought together 8000+ participants fr=
om
> all over the world.  Its home is in the city of Brussels (Belgium).
>=20
> FOSDEM 2023 will take place as an in-person event during the weekend of F=
ebruary
> 4./5. 2023. More details about the event can be found at http://fosdem.or=
g/
>=20
> ** Call For Participation
>=20
> The Software Defined Storage devroom will go into its seventh round for t=
alks
> around Open Source Software Defined Storage projects, management tools
> and real world deployments.
>=20
> Presentation topics could include but are not limited too:
>=20
> - Your work on a SDS project like Ceph, Gluster, OpenEBS, CORTX or Longho=
rn
>=20
> - Your work on or with SDS related projects like OpenStack SWIFT or Conta=
iner
> Storage Interface
>=20
> - Management tools for SDS deployments
>=20
> - Monitoring tools for SDS clusters
>=20
> ** Important dates:
>=20
> - Dec 10th 2022:  submission deadline for talk proposals
> - Dec 15th 2022:  announcement of the final schedule
> - Feb  4th 2023:  Software Defined Storage dev room
>=20
> Talk proposals will be reviewed by a steering committee:
> - Niels de Vos (Red Hat)
> - Jan Fajerski (Red Hat)
> - TBD
>=20
> We also welcome additional volunteers to help with making this devroom a
> success.
>=20
> Use the FOSDEM 'pentabarf' tool to submit your proposal:
> https://penta.fosdem.org/submission/FOSDEM23
>=20
> - If necessary, create a Pentabarf account and activate it.
> Please reuse your account from previous years if you have
> already created it.
> https://penta.fosdem.org/user/new_account/FOSDEM23
>=20
> - In the "Person" section, provide First name, Last name
> (in the "General" tab), Email (in the "Contact" tab)
> and Bio ("Abstract" field in the "Description" tab).
>=20
> - Submit a proposal by clicking on "Create event".
>=20
> - If you plan to register your proposal in several tracks to increase your
> chances, don't! Register your talk once, in the most accurate track.
>=20
> - Presentations have to be pre-recorded before the event and will be stre=
amed
> on   the event weekend.
>=20
> - Important! Select the "Software Defined Storage devroom" track
> (on the "General" tab).
>=20
> - Provide the title of your talk ("Event title" in the "General" tab).
>=20
> - Provide a description of the subject of the talk and the
> intended audience (in the "Abstract" field of the "Description" tab)
>=20
> - Provide a rough outline of the talk or goals of the session (a short
> list of bullet points covering topics that will be discussed) in the
> "Full description" field in the "Description" tab
>=20
> - Provide an expected length of your talk in the "Duration" field.
>   We suggest a length between 15 and 45 minutes.
>=20
> ** Recording of talks
>=20
> The FOSDEM organizers plan to have live streaming and recording fully wor=
king,
> both for remote/later viewing of talks, and so that people can watch stre=
ams
> in the hallways when rooms are full. This requires speakers to consent to
> being recorded and streamed. If you plan to be a speaker, please understa=
nd
> that by doing so you implicitly give consent for your talk to be recorded=
 and
> streamed. The recordings will be published under the same license as all
> FOSDEM content (CC-BY).
>=20
> Hope to hear from you soon! And please forward this announcement.
>=20
> If you have any further questions, please write to the mailing list at
> storage-devroom@lists.fosdem.org and we will try to answer as soon as
> possible.
>=20
> Thanks!
>=20
> _______________________________________________
> FOSDEM mailing list
> FOSDEM@lists.fosdem.org
> https://lists.fosdem.org/listinfo/fosdem

----- End forwarded message -----

--TYZdRhObIo8E0xxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJGBAEBCAAwFiEE2fjs+xSOMib3tz3+JejkACnCxbMFAmN1BdESHG5kZXZvc0By
ZWRoYXQuY29tAAoJECXo5AApwsWzpT0P/REVcFqIKErTHeeBKSzoTJ8aRwDQh/9M
6idAC1BA5B6HMhJytfJRtswXDiVxMooJJFKhWciIUmiypyA3Raxth7oGHNlEuJw3
wEJtHXOQ6VJMw6r3j3lWqc1lUeNY1MaQExrFkmi2Hcyx48mFvx752QJbUYdTRg4i
cEpahljNBfveLmd3mGEdhJo6gKnLrEkgre12QRyHHQqW6DxHGvG735BbiN3qSBLR
Z8yyNy0yi9ilSB2NIn2qE+8b4A+v5+lgrKmtCwO9T2Eba+45bBRfhT71nuaLUGYF
XCmN5w7lJSY/e+UwwePtsQlzSFQES2kWt/a4rpHZVshKxsKB+ljWu33FsB13fYwU
Di3LXRvspKK0hlswAS4BMb/LFI9qSYgvY4tGEM46+TIB+f0tEBOof+o8q7+Ta8b2
wEQsFYulwl3flAIhxQHGnjVchIJwxc8/d7Mu8g96dEM4+FkP/AuWT7J/tMCTljlE
LJdYO5HOmKlNykml0jQ8KqRIj9EAn3sSKmi8LKAhBLmmPo5OGvud5IRGidrWor2a
MD0nkcMAQFuopn/bTz1ehnbVd4hAVlqp3PI9XHw5FuzUcfJUi+S7GDYY67bPAbxj
JGcLV0U0SiS05z4ToCiHlntrGeZtW33cPyvqgLUzGmbjpgCh0HY0nGJ/PEX09pWb
U4piO8LMxq5v
=Z5ji
-----END PGP SIGNATURE-----

--TYZdRhObIo8E0xxD--


