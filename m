Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30BDFB1C
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 16:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=tiJEOE11EsHwhL+acTWkTUE3n6YD0cEQBixIlMTgG3w=; b=1dHfvLSU7lDLjb3P+AOLlOgwKL
	Mfm+G7Bk1gdANxn71fTg/pFdWujj6Sbk8shzm1gtOjGdzsi78n++cnZh63UxSfSpwDseZ8oe50hi3
	hL95I3I41y48NPu8AxGrpnRK585q21VhRBhJHVUW9ZLusMAyJharKNgq0VHJgaf+kfWHJcVRFyAJv
	d4MibhAah2nzq39j5OiJqW35y87axRY8ItCt9kbPQmgaPQgpgweAjOnSAMVGqt7Ngtyei9bWs/eYJ
	DeJYELeUxA7WxBwRnnaLTf6rsanG2owPi+vkqpDdc8VbXnfy/FgRAQxsRzAT3ip7SKaFwoIqxYd4f
	f7FmqmRQ==;
Received: from localhost ([::1]:52066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLTSn-003rYQ-1e; Tue, 30 Apr 2019 14:10:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:38060) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLTSi-003rYJ-SP
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 14:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=tiJEOE11EsHwhL+acTWkTUE3n6YD0cEQBixIlMTgG3w=; b=BM8in7Nw5NWy68U0gzRguXNwWj
 PZSAf2efUCujdvplIAnfQL3j9L5eemFKRiKGIlj3Cs3Gqkcp29L+0NnBaSr0Dt9fVtpMSH5iWWa7n
 gqdDCg/T5juW75U9GT8oZUOQF5KwE/XnSHhWJDnlecT5k+tNtwssUAXZMADZMdluiV+w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLTSi-00042b-Ce; Tue, 30 Apr 2019 14:10:24 +0000
To: Rowland Penny <rpenny@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
Date: Tue, 30 Apr 2019 16:10:23 +0200
Message-ID: <3513637.hkN0grMHb1@magrathea.fritz.box>
In-Reply-To: <20190430145845.6fcfb681@devstation.samdom.example.com>
References: <20190429193555.GA28948@samba.org>
 <2134250.fEHozF1qz7@magrathea.fritz.box>
 <20190430145845.6fcfb681@devstation.samdom.example.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, April 30, 2019 3:58:45 PM CEST Rowland Penny wrote:
> On Tue, 30 Apr 2019 15:25:18 +0200
> Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
>=20
> wrote:
> > On Tuesday, April 30, 2019 2:12:57 PM CEST Nico Kadel-Garcia via
> >=20
> > samba- technical wrote:
> > > On Tue, Apr 30, 2019 at 3:58 AM Andrew Bartlett
> > >=20
> > > <abartlet@samba.org> wrote:
> > > > On Tue, 2019-04-30 at 08:38 +0200, Andreas Schneider via samba-
> > > >=20
> > > > technical wrote:
> > > > > On Tuesday, April 30, 2019 6:30:06 AM CEST Andrew Bartlett
> > > > >=20
> > > > > wrote:
> > > > > > On Tue, 2019-04-30 at 06:21 +0200, Ralph B=F6hme wrote:
> > > > > > > > > Also, could you please look into adding CentOS 7 as a
> > > > > > > > > supported
> > > > > > > > > platform via our bootstrap system so we don't regress
> > > > > > > > > here in the
> > > > > > > > > future?  There is partial support already, but it wasn't
> > > > > > > > > finished
> > > > > > > > > (mostly to avoid chasing two rabbits at once).
> > > > > > > >=20
> > > > > > > > That is a new area to me. I see that CentOS is listed
> > > > > > > > under bootstrap/generated-dists/centos7/. Would the only
> > > > > > > > missing piece be the
> > > > > > > > centos7 entries in .gitlab-ci.yml, or am i missing
> > > > > > > > something? I can give
> > > > > > > > that a try tomorrow.
> > > > > > >=20
> > > > > > > that would be much appreciated and I can help with that,
> > > > > > > but it's certainly not a requirement to get your patch for
> > > > > > > the missing- field-
> > > > > > > initializers in. I'll review later on.
> > > > > >=20
> > > > > > Thanks Ralph for offering to help.  It has been really cool
> > > > > > to see so
> > > > > > many folks stepping in to maintain and extend our package
> > > > > > list.  It is
> > > > > > lovely to have this task, but even more so the knowlege of
> > > > > > how to do it
> > > > > > practically, distributed around the team!
> > > > > >=20
> > > > > > I totally agree this is not a pre-requisite, thanks for
> > > > > > making that clear!
> > > > >=20
> > > > > Here we go. Should be fine as GnuTLS and KRB5 are not that old
> > > > > as on Ubuntu
> > > > > 14.04 :-)
> > > > >=20
> > > > > https://gitlab.com/samba-team/samba/merge_requests/399
> > > >=20
> > > > I've CC'ed S=E9rgio and Nico who recently had a thread about
> > > > building modern Samba on CentOS7.  They may be able to help here.
> > > >=20
> > > > Their work is online at:
> > > > https://github.com/sergiomb2/SambaAD
> > > > https://github.com/nkadel/samba4repo
> > > >=20
> > > > Thanks to everyone working to show Samba master can be built and
> > > > developed on CentOS7, much better to confirm this now than find
> > > > out at RC4 ;-)
> > >=20
> > > I'm concerned that the necessary building tools for
> > > "compat-nettle32" and "compat-gnutls" from Sergio are not apparent
> > > in that merge request. I found those necessary because I disabled
> > > the "experimenta" MIT KRB options, and gnutls is not recent enough
> > > on RHEL 7. Sergio For my work, I also have a full build structure
> > > and a set of git submodules with all the libtdb, libtalloc,
> > > libtevent, and libldb libraries to build up for a full deployment:
> > > sergio used the "build the libraries internally in Samba" option.
> >=20
> > The MIT Kerberos build needs to build backupkey with GnuTLS, the
> > relevant symbol has been backported to RHEL7!
> >=20
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1378373
> >=20
> > However we don't have a correct configure check for that in Samba.
> > This is in a branch waiting to be reviewed:
> >=20
> > https://gitlab.com/samba-team/samba/merge_requests/393/diffs?
> > commit_id=3D5ae3d095a9d2c222a4efe018193a099c756154db
> >=20
> > I've never tested it but with that we could probably lower the
> > required GnuTLS version in a Samba AD build with MIT Kerberos to 3.2
> > using a patch for the spec file. I wouldn't do that on Samba upstream.
> >=20
> > > I'm not sure how to merge the work into the existing bootstrap
> > > procedure, since they'd also expect these other modules to be built
> > > and available in the bootstrap and yum deployment. Do these
> > > bootstrap environment ssupport the use of "mock" ? I've also just
> > > noted that mock, on RHEL 7, does not support "file://$PWD" syntax
> > > for finding the local repository that my setup drops generated
> > > RPM's in. Works great on Fedora, not on RHEL 7 or CentOS 7. That
> > > means the build environment needs a web-based access to the built
> > > repository, which I'm doing with "nginx", on RHEL 7. That.... makes
> > > it more awkward for an individual software builder to be access
> > > their local working repositories. It can be done stably, but it
> > > needs to be really locked down for a safe build environment.
> >=20
> > The issue is that we need at least python34-crypto, python34-dns and
> > those are not available in EPEL7!
> >=20
> > I'm sure your packages still use python2 :-)
> >=20
> > 	Andreas
>=20
> Quite right EPEL doesn't have python34-crypto or python34-dns, but it
> does have these:
>=20
> https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_6=
4/P
> ackages/p/python36-crypto-2.6.1-16.el7.x86_64.rpm
> https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_6=
4/
> Packages/p/python36-dns-1.15.0-8.el7.noarch.rpm

I think we are more lucky once RHEL 7.7 is out :-)

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



