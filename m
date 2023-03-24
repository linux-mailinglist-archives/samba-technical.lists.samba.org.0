Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 762DF6C8579
	for <lists+samba-technical@lfdr.de>; Fri, 24 Mar 2023 20:01:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QaLda8XSry9+QelTAzjCurjAqnq6kq9PlXKbnbbrRwU=; b=2kekyG1r3JIeO9z3v1GdppJkkE
	G5owtB3FlEB+Yw+MoEhSBldIOTF5ZUw4iJ2d+3/iIQg/IBq+ps/TvTt7XNIT/BcHLdPfhoNtm6hYu
	w1BMbastee8GrHzxoAdQyL21vjhMzgs1oH6uxPHj4gNoz/Eqp6NQEcyaptcCXFcaw6PqWyiI/p/NM
	yje4XFNbY5llHCWeIaz4V4kn+p+7XMb2uhc4pbg3+Dm0FhC4n6HA/VzXnQcAAx8MjNdwtGBB8EJuY
	0h3H5cyk7ZttpkXTU5v3ap+W68ZUH8yDI0Bbr/zweXlqq5/4v+nxxLmjNqgA0x2J6NhQ3smb4+1Fo
	s/jwW4nQ==;
Received: from ip6-localhost ([::1]:43300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pfmfR-004O2K-SQ; Fri, 24 Mar 2023 19:01:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pfmfN-004Nyu-Ay
 for samba-technical@lists.samba.org; Fri, 24 Mar 2023 19:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=NUij6fSYFv3ON6GLnAh8mhRUECsEDtv3+40llctSQGc=; b=dGnwQZAkP6gsd4PKxGx/2nPMnJ
 TtWcWyBzETAv1HK3n+d61F/NDnUXOgYtmGGbD0wZul+oDNT5CzWQ93zFmbyNAdegp5qmoejzACYK1
 ZAhfWSqB5qQoj0y84fY6zQ6sqj/I+DKV2OqjOdlAU3lK/g3uAS+sqTKaR+kn4kt/CzO17tpZ6vayE
 WLT8gzzjkbmdBnMdQ6cSmi2EUJNNcmDQGtoeGhLqZ+L+V40GJ7rb9nv1f4mAzUhPy92eF6FlQk4jJ
 Lh3BA0pKYjA04m0nyAhe0k79miBi0ArykILcbVU0bDhZ4F9qPuNG5mtGxGKSDHak/yJ66p3dybfbH
 SXnw3iDm6KkP+UpQjXvLFv2mY0IvMu0/BMVghli9sOMTcSIADR+yfwhjxglpnq5PZn1yV7/FTNQM0
 fds+e8in6AAwTEdfFBB4gAA4N7FzNncfXXtxvLHucxIi7ZIKdrx0Iv9IJRh/9MVow+6o5q2xVKOUj
 qn21B5lw3UDs6YfY6flA7cG5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pfmfJ-005G1T-EC; Fri, 24 Mar 2023 19:01:30 +0000
Message-ID: <06a484a872e1413eaaa3fc54cf2c9bab3535316b.camel@samba.org>
Subject: Re: Possible regression in samba-tool provision
To: John Mulligan <phlogistonjohn@asynchrono.us>, 
 samba-technical@lists.samba.org
Date: Sat, 25 Mar 2023 08:01:26 +1300
In-Reply-To: <5862845.irdbgypaU6@edfu>
References: <5862845.irdbgypaU6@edfu>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2023-03-24 at 10:10 -0400, John Mulligan via samba-technical
wrote:
> Hi samba team,
>=20
> One of our projects consumes container images based on nightly rpm builds=
 of=20
> samba master. Over the last day or two one of our test jobs has been fail=
ing=20
> and I think it is due to recent changes.  This might only affect mit krb5=
 based=20
> builds.

Thanks John so much for testing and getting in touch. =C2=A0We greatly
appreciate those who test master!

> When provisioning a domain we see a traceback like so:
>=20
> INFO 2023-03-23 21:22:50,399 pid:6 /usr/lib64/python3.10/site-packages/sa=
mba/
> provision/__init__.py #2021: Fixing provision GUIDs
> ERROR(<class 'AttributeError'>): uncaught exception - 'DomainUpdate' obje=
ct=20
> has no attribute 'upper'
>   File "/usr/lib64/python3.10/site-packages/samba/netcmd/__init__.py", li=
ne=20
> 230, in _run
>     return self.run(*args, **kwargs)
>   File "/usr/lib64/python3.10/site-packages/samba/netcmd/domain.py", line=
 555,=20
> in run
>     result =3D provision(self.logger,
>   File "/usr/lib64/python3.10/site-packages/samba/provision/__init__.py",=
 line=20
> 2408, in provision
>     create_kdc_conf(paths.kdcconf, realm, domain, os.path.dirname(lp.get(=
"log=20
> file")))
>   File "/usr/lib64/python3.10/site-packages/samba/provision/kerberos.py",=
 line=20
> 43, in create_kdc_conf
>     domain =3D domain.upper()
> Temporarily overriding 'dsdb:schema update allowed' setting
>=20
> This is followed by some other logging output but the overall command fai=
ls.
>=20
> I tracked this down to change 4bba26579d124af6c0767bb98bee67357001e1e7 wh=
ich=20
> adds some code to `python/samba/provision/__init__.py`. Part of the diff:
>=20
> > +                try:
> > +                    from samba.domain_update import DomainUpdate
> > +
> > +                    domain =3D DomainUpdate(samdb, fix=3DTrue)
> > +                    domain.check_updates_functional_level(adprep_level=
,
> > +                                                        =20
> > DS_DOMAIN_FUNCTION_2008, +                                             =
   =20
> >         update_revision=3DTrue) +
> > +                    samdb.transaction_commit()
> > +                except Exception as e:
> > +                    samdb.transaction_cancel()
> > +                    raise e
>=20
> This block uses the variable domain that gets assigned a DomainUpdate obj=
ect,=20
> but the lines below:
>=20
> >          if not is_heimdal_built():
> >              create_kdc_conf(paths.kdcconf, realm, domain,
> >              os.path.dirname(lp.get("log file"))) logger.info("The Kerb=
eros           =20
> KDC configuration for Samba AD is "
>=20
> pass domain to create_kdc_conf which expect the value in domain to be a=
=20
> string.  Skimming the code I think this block is the last to use domain=
=20
> variable, and the only one to use it after it gets reassigned to a=20
> DomainUpdate object, so it's probably only the mit krb5 build that will h=
it=20
> this error.
> A fix might be to just rename `domain` variable in the new block or even =
remove=20
> it and chain the=20
> `DomainUpdate(...).domain.check_updates_functional_level(...)` together.

Please propose such a patch in GitLab, if you can!

> In the mean time, we think we may be able to work around this issue by us=
ing=20
> the `--adprep-level` option, but we are still investigating.
>=20
> If you have any other questions, comments, or would prefer I report this =
to=20
> bugzilla please just ask.  Thanks!

I don't think we need this, it is only in master.

> --John M.
>=20
>=20
> PS: As a python coder, the samdb transaction handling could be written in=
 a=20
> neater way using a context manager. ;-) ;-)

Samba's python was written by C programmers, so moves to allow more
pythonic handling would be greatly appreciated.

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

