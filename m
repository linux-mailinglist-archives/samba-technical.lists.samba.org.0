Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6EC296036
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 15:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WE2FmBMDqYwgbSlubAjTYCSFoAAlmc/+RBEe0kZ7tpw=; b=k8yge4IjHk5e72Hgjenfgfbz/Z
	4QfeOzXHb+KrlL8oeN9pmDWVYBSoCryrfGJhBNfxQNaqNf24u1XBxgGBbG/py9u2RUtMYWWW2JOH3
	b3G4pQwzduvTchmxq7b3KBbpUEk3s/yxKu9BMU8V14R+ACnTZiC7q4a3qlGECm/pBlqnSHROISQIR
	bp3kjrlD81AVD/X4raONTXwDSE+vDTUwTcp6xrnqAkX6oytLjn+8sS82xujulTFf5EGwcMBChtTT2
	jFnlJA+n9n5hXUJ5wRth4uSH7vDhQgrSaM+4H/w3UbjR5hQ8glEwsHvv7rnnI17akl97okiEIye+s
	DWpJR6aw==;
Received: from ip6-localhost ([::1]:54102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVaqB-00DHnk-PM; Thu, 22 Oct 2020 13:41:15 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:48518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVaq6-00DHml-Em
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 13:41:12 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1603978863.73233@Xu4PPedwub4SgCSHIOU5UQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 442A711F1CD.A7A82
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 442A711F1CD
 for <samba-technical@lists.samba.org>; Thu, 22 Oct 2020 15:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1603374063;
 bh=QZ/w5EC+HGl7PVrcY9kiFEe3Sg2du7MhBYTWJw4q97M=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=kRy0nK/P+2fzw5E0E6h1aRsakbLVJ/S/+tzAv+Lw7/O+1i/daotJmh7+vhxlA1mwi
 EHsRRHdVlPMu2accSv2d4mi2yowh30cG2nCf5uHQW/FcQZhd/BwFZcs2ObMs0fSr6A
 /EExLZy31aLzJxkVc40NgFSLQzmRpD+XCCPLi2KNHMWJoyH1PRY5IQbEk2dQnZna5T
 wiq5uix1gsQDd85qVsfJ0DOhNSES1zSMBQUL/AzvT8nIE+T4LaQCvaPasl9SmGnn3X
 9BkQ6Ro/PmIrarMyspGfruGzG2PjsgdPHE1A7p96bDTADzyX0igLWTockOt4e9a/Pb
 5AMHO4wdfwz4A==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id D5B2B3AF8C
 for <samba-technical@lists.samba.org>; Thu, 22 Oct 2020 15:41:01 +0200 (CEST)
Subject: RE: 4.12 -> 4.13 upgrade
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 22 Oct 2020 15:41:01 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0f2f2a1b-e818-e2d9-7372-bdc8331a9427@samba.org>
References: <vmime.5f915a06.1483.6a1ed22ad77c366@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdaoePq+4XJXzUiQTvG+7QMmpqbB0A==
Message-Id: <vmime.5f918bed.198e.754e857b761d4e3d@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Rowland penny via samba-technical
> Verzonden: donderdag 22 oktober 2020 14:35
> Aan: samba-technical@lists.samba.org
> Onderwerp: Re: 4.12 -> 4.13 upgrade
>=20
> On 22/10/2020 11:08, L.P.H. van Belle via samba-technical wrote:
> >  =20
> >
> >> -----Oorspronkelijk bericht-----
> >> Van: samba-technical
> >> [mailto:samba-technical-bounces@lists.samba.org] Namens
> >> Rowland penny via samba-technical
> >> Verzonden: donderdag 22 oktober 2020 12:00
> >> Aan: samba-technical@lists.samba.org
> >> Onderwerp: Re: 4.12 -> 4.13 upgrade
> >>
> >> On 22/10/2020 10:06, L. van Belle via samba-technical wrote:
> >>> Hai,
> >>>
> >>> Small question, i cant find this.
> >>>
> >>> So after the 4.13.0 (on
> >>> release date) I upgrade a DC and that failed. so i reverted
> >> back to my VM
> >>> snapshot.
> >>>
> >>> I now see the following in the logs.
> >>>
> >>> [2020/10/22 10:48:36.514438,
> >>>    0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)
> >>>
> >>>    /usr/sbin/samba_dnsupdate: /usr/sbin/samba_dnsupdate:274:
> >>> DeprecationWarning: please use
> >> dns.resolver.Resolver.resolve() instead
> >>> [2020/10/22 10:48:36.521212,
> >>>    0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)
> >>>
> >>>    /usr/sbin/samba_dnsupdate:
> >>>
> >>>    return resolver.query(name, name_type)
> >>>
> >>> Now, when i
> >>> look at DC2, which stayed at 4.12.8, that one is not showing any
> >>> DeprecationWarnings.
> >>>
> >>> And i recently added a 3th DC with 4.12.8 and same no
> >> DeprecationWarning.
> >>> Im trying to find why only DC1 has this message even after
> >> the i reverted to
> >>> the VM backup.
> >>>
> >>> So i hoped today that after the fix for 4.13 for the start
> >> up, i did an
> >>> upgrade again on my production DC1, having the
> >> DeprecationWarning message
> >>> Only that didnt solve it. Its all running fine thats not
> >> the problem.
> >>> Strange thing here is, DC2
> >>> is a copy of DC1 and doesnt show this and same for the=20
> new DC setup.
> >>>
> >>> Anyone suggestions
> >>>    what this is, and maybe how to make the error disapear=3F
> >>>
> >>> Its a very constant message since i see it every 10 minuts.
> >> You would, that is the frequency that samba_dnsupdate is run.
> >>
> >> Could you be running bullseye on that DC =3F
> > No, im sure this is buster ;-)
> >
> >> Which would mean python3-dnspython V2.0.0 and in this version
> >> resolver.query is deprecated.
> >>
> > Good one, i checked this.
> >
> > DC1  :
> > dpkg-query -s python3-dnspython
> > Package: python3-dnspython
> > Status: install ok installed
> > Priority: optional
> > Section: python
> > Installed-Size: 618
> > ...
> >
> > Same on all DC's.
> >
> >
> > All run the following setting with netbios name changed offcourse.
> > [global]
> >          netbios name =3D RTD-DC0
> >          workgroup =3D ADDOM
> >          realm =3D ADDOM.INTERNAL.TLD
> >
> >          server role =3D active directory domain controller
> >          server services =3D -dns -spoolss
> >          idmap_ldb:use rfc2307 =3D yes
> >
> >          # + A manual setup for TLS/SSL Certificates.
> >          tls keyfile =3D /etc/ssl/local/private/xxxxxxxxxx.key.pem
> >          tls certfile =3D /etc/ssl/local/certs/xxxxxxxxxx.cert.pem
> >          tls cafile =3D /etc/ssl/local/certs/xxxxxxxxxx-ca.pem
> >
> >          template shell =3D /bin/bash
> >          template homedir =3D /home/users/%U
> >
> >          load printers =3D no
> >          printcap name =3D /dev/null
> >
> >          ntlm auth =3D mschapv2-and-ntlmv2-only
> >
> > And the shares offcourse..  So nothing fancy.
> >
> > Other options=3F
> >
> > And thanks for the reply :-)
> >
> > Greetz,
> >
> > Louis
> >
> >
> >
> OK, you are running buster but you must be running python3-dnspython=20
> version 2.0.0 because that error message is coming from that=20
> version, it has nothing to do with Samba:
>=20
>  =A0=A0=A0 def query(self, qname, rdtype=3Ddns.rdatatype.A,=20
> rdclass=3Ddns.rdataclass.IN,
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp=3DFalse, source=3DNone, raise_on_no_answer=3DTrue,=20
> source_port=3D0,
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lifetime=3DNone):=A0 # pragma: no cover
>  =A0=A0=A0=A0=A0=A0=A0 """Query nameservers to find the answer to the question.
>=20
>  =A0=A0=A0=A0=A0=A0=A0 This method calls resolve() with ``search=3DTrue``, and is
>  =A0=A0=A0=A0=A0=A0=A0 provided for backwards compatbility with prior versions of
>  =A0=A0=A0=A0=A0=A0=A0 dnspython.=A0 See the documentation for the resolve()=20
> method for
>  =A0=A0=A0=A0=A0=A0=A0 further details.
>  =A0=A0=A0=A0=A0=A0=A0 """
>  =A0=A0=A0=A0=A0=A0=A0 warnings.warn('please use=20
> dns.resolver.Resolver.resolve() instead',
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DeprecationWarning, stacklevel=3D2)
>  =A0=A0=A0=A0=A0=A0=A0 return self.resolve(qname, rdtype, rdclass, tcp, source,
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 raise_on_no_answer, source_port,=20
> lifetime,
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 True)
>=20
> Version 1.16.0 (which Buster should be using) does not have the=20
> 'DeprecationWarning'.

I do agree with you but..=20
Well,  im 100% sure its 1.16 thats installed.=20

dpkg -l |grep python3-dnspython
ii  python3-dnspython              1.16.0-1                      all          DNS toolkit for Python 3

So what im doing now, the just installed new DC, im compairing all installed packages with the other one.
Installed DC1 and DC2 somewhere in 2015/16
Installed DC0 2 weeks ago but only DC1 is giving these messages.=20

Im compairing more here whats going on.
I even upgraded DC1 today to 4.13 with the new packages.=20
Runs great, but still same message..=20

I go look more into this whats going on..
Its mainly python this might come from, because then ill tripple check all python modules again.=20


Thank you so far.


Greetz,=20

Louis






