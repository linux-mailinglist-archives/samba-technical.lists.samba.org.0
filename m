Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58286BF56
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 04:10:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=e5zZJ5qU4zurDBA2sBRiQLj+BPyOzca9GfNGKRASXrk=; b=Esx8w4IzHlKpSYBeYp/IiJt8Q5
	98RZwFjIYqD75zd+z2cMY1mjCJBh0G0zxrtUritadmGR8Hx7/fSreJ1K8RUHPHgteFXfLUG1HZH0t
	u6WiO/5Z2HimTckZjcpar+rBwsrDi5n6FiMtWk1fIpH8Z3oJcf32bLcI3AZ+7Tjsx+2Gpz4+s0eyX
	Pb77CGxftFXu0lMwTQxthpvWE9Yp/DICwJVq7LpvyR/hnn8qjrst/9caXXo9WFVsACbxNczZVDWxa
	FV5A7N5U4tV/VAnJ6KcoKNuV0mTxxXk/RlsaAsH4pmxtttOWEoNDYKOSs8zxcwyu9lvYVKMDqc5jy
	Hak8wetQ==;
Received: from ip6-localhost ([::1]:51860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rfWoi-009fDg-IE; Thu, 29 Feb 2024 03:10:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11952) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfWod-009fDZ-Lw
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 03:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=bIultSjRdomowmAVzWVtl6ROW8sX3XhwT8nzdDa1ppw=; b=P2Lqf0rp10Zq+5qbwg0aKhc8NQ
 ngc2sykw6C+FHKsl7n3kE4gx4VsKheegQqoOhhvJ0CzBKdx3ji6fFAEvLFqq78/OtfRZlIfWj97Io
 g9tTYk12ppujRSCxge4HrKKjoDt0snnZPfI1ejNfWcsOVJKnvasnchZFe6zIUjeWw3pn7/tB6VTMq
 ArEnc5jIpIf7EeT0B6zr/m53XEthmV7scVzaeqgdbVVGltEXeOiwOPdo27eyK9OG3XScWT4ExCSeN
 Mp22cqVWJpAxN9uRjAAG9C6dmOXJiVN/SN7EnTmyHYTVXFO/39gJchnkxG+ZAPYYlsoBNf6bt3Jaf
 OXrc7fZtjrNTbq0BdOKWrS9IifJcm2fI5LXetgsoAVSbKFR1VtfxoyfIkyo6Xk0pLWuzU/mY7uVqJ
 o6rkhwaXR0uzltz1LZrh0ULFGIjehN4HQy5wnnApiMXFqu0r90ZX9/TrAk0bjEmS6QcYUv1a/4R7N
 FxOY4BQVtT2yIgQGF2Sd3gbx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfWoc-00FLau-0x; Thu, 29 Feb 2024 03:10:34 +0000
Message-ID: <6b86a32e36a815cd2394e05600d963262601f7c1.camel@samba.org>
Subject: Re: Samba 4.20.0rc2 fails to support "--with-includelibs" or build
 Heimdall Kerberos
To: Nico Kadel-Garcia <nkadel@gmail.com>, Alexander Bokovoy <ab@samba.org>
Date: Thu, 29 Feb 2024 16:10:29 +1300
In-Reply-To: <CAOCN9rz3nPyzGyyZVHAydFxaO0wDstMnDSZUttYs6D+c4VXk3w@mail.gmail.com>
References: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
 <ZdIU8U1tFrsf0Yi2@toolbox>
 <CAOCN9rwCGJOhK2EkCDJOeahbt7j1R5fNpbd+55rjrKrtCbqjtA@mail.gmail.com>
 <Zd2jaaIxgSWMiZ6f@toolbox>
 <CAOCN9rz3nPyzGyyZVHAydFxaO0wDstMnDSZUttYs6D+c4VXk3w@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I think this is a red herring.  The files did move, but so did the
heimdal_build directory that references them.
Andrew,
On Wed, 2024-02-28 at 21:57 -0500, Nico Kadel-Garcia via samba-
technical wrote:
> Thanks, I'll check it out!
> On Tue, Feb 27, 2024 at 3:55 AM Alexander Bokovoy <ab@samba.org>
> wrote:
> > On Няд, 25 лют 2024, Nico Kadel-Garcia wrote:
> > > On Sun, Feb 18, 2024 at 9:29 AM Alexander Bokovoy <ab@samba.org>
> > > wrote:
> > > > On Sun, 18 Feb 2024, Nico Kadel-Garcia via samba-technical
> > > > wrote:
> > > > > I've been publishing backports of current Samba releases for
> > > > > RHEL toinclude full domain controller capability for a few
> > > > > years now. Red Hatelects to turn off the domain controller
> > > > > features at build time, andthe Fedora SRPM's reflect this
> > > > > decision for RHEL. Building for RHELmeand activating "--with-
> > > > > includelibs" in order to avoid conflicts withthe libldb,
> > > > > libtdb, etc. versons used by sssd and other default tools.
> > > > > My current work is published at 
> > > > > https://github.com/nkadel/samba4repo/.When I enable the use
> > > > > of the built-in Heimdall Kerberos with the"system_mit_krb5"
> > > > > option in the .spec file, I get these errors whencompiling
> > > > > Samba with the "mock" command.
> > > 
> > > [ log snipped ]
> > > 
> > > > This just shows that systemd-nspawn execution failed when
> > > > running'rpmbuild -bb ... samba.spec'. Are there are any more
> > > > logs available?
> > > > In particular, prior to
> > > > > error: Bad exit status from /var/tmp/rpm-tmp.sarBcy
> > > > > (%build)RPM build errors:
> > > > 
> > > > --/ Alexander Bokovoy
> > > 
> > > I normally do these builds with "mock". Working from a CentOS 8
> > > systemwith more standard rpmbuild setup:
> > > symlink: samba_downgrade_db -> ./samba_downgrade_dbsymlink:
> > > samba-tool -> ./samba-toolsymlink: samba-gpupdate -> ./samba-
> > > gpupdatesymlink: smbaddshare -> ./smbaddsharesymlink:
> > > smbchangeshare -> ./smbchangesharesymlink: smbdeleteshare ->
> > > ./smbdeleteshareChecking project rules ...Project rules pass[1/1]
> > > Processing VERSION: VERSION buildtools/wafsamba/samba_version.py-
> > > > bin/default/version.hWaf: Leaving
> > > directory`/home/nkadel/git/nkadel/samba4repo/samba-
> > > srpm/rpmbuild/BUILD/samba-4.20.0rc2/bin/default'source not found:
> > > '../heimdal/lib/wind/gen-errorlist.py' in
> > 
> > ^^ it did not find the gen-errorlist.py file.
> > It is now in ./third_party/heimdal/lib/wind/gen-errorlist.py
> > whilebefore commit 7055827b8ffd3823c1240ba3f0b619dd6068cd51 it was
> > in./source4/heimdal/lib/wind/gen-errorlist.py:
> > -----------------------------------------------------------------
> > -------------------commit
> > 7055827b8ffd3823c1240ba3f0b619dd6068cd51Author: Stefan Metzmacher <
> > metze@samba.org>Date:   Wed Jan 19 13:15:45 2022 +0100
> >     HEIMDAL: move code from source4/heimdal* to
> > third_party/heimdal*
> >     This makes it clearer that we always want to do heimdal
> > changes    via the lorikeet-heimdal repository.
> >     Signed-off-by: Stefan Metzmacher <metze@samba.org>    Reviewed-
> > by: Joseph Sutton <josephsutton@catalyst.net.nz>
> >     Autobuild-User(master): Joseph Sutton <jsutton@samba.org>    Au
> > tobuild-Date(master): Wed Jan 19 21:41:59 UTC 2022 on sn-devel-184
> > (part of the commit 7055827b)diff --git
> > a/source4/heimdal/lib/wind/gen-errorlist.py
> > b/third_party/heimdal/lib/wind/gen-errorlist.pysimilarity index
> > 100%rename from source4/heimdal/lib/wind/gen-errorlist.pyrename to
> > third_party/heimdal/lib/wind/gen-errorlist.py--------------------
> > ----------------------------------------------------------------
> > I suspect other locations using ../heimdal/ prefix would need to
> > beadjusted to use new location. These are mostly in
> > $ git grep '\.\./heimdal/'third_party/heimdal_build/gssapi-
> > glue.c:#include
> > "../heimdal/lib/gssapi/gssapi_mech.h"third_party/heimdal_build/hdb-
> > glue.c:#include
> > "../heimdal/lib/hdb/hdb_locl.h"third_party/heimdal_build/krb5-
> > glue.c:#include
> > "../heimdal/lib/krb5/krb5_locl.h"third_party/heimdal_build/krb5/kdc
> > -plugin.h:#include "../../heimdal/kdc/kdc-
> > plugin.h"third_party/heimdal_build/roken.h:#include
> > "../heimdal/lib/roken/roken.h.in"third_party/heimdal_build/vis.h:#i
> > nclude
> > "../heimdal/lib/roken/vis.hin"third_party/heimdal_build/wscript_bui
> > ld:            source =
> > '../heimdal/lib/roken/err.hin',third_party/heimdal_build/wscript_bu
> > ild:            target =
> > '../heimdal/lib/roken/err.h',third_party/heimdal_build/wscript_buil
> > d:        includes='../heimdal/lib/roken ../heimdal/include
> > ../heimdal_build/include',third_party/heimdal_build/wscript_build: 
> >        includes='../heimdal/lib/roken ../heimdal/include
> > ../heimdal_build/include',third_party/heimdal_build/wscript_build: 
> >                    includes='../heimdal/lib/gss_preauth',third_part
> > y/heimdal_build/wscript_build:                        includes='../
> > heimdal/kdc',third_party/heimdal_build/wscript_build:              
> >           includes='../heimdal/lib/ntlm',third_party/heimdal_build/
> > wscript_build:        includes='../heimdal/lib/asn1')third_party/he
> > imdal_build/wscript_build:        includes='../heimdal/lib/hdb',thi
> > rd_party/heimdal_build/wscript_build:        includes='../heimdal/l
> > ib/hdb',third_party/heimdal_build/wscript_build:        includes='.
> > ./heimdal/lib/asn1',third_party/heimdal_build/wscript_build:       
> >  includes='../heimdal/lib/asn1',third_party/heimdal_build/wscript_b
> > uild:                      includes='../heimdal/lib/gssapi/gssapi
> > ../heimdal/lib/gssapi/spnego ../heimdal/lib/gssapi/krb5
> > ../heimdal/lib/gssapi/mech
> > ../heimdal/lib/ntlm',third_party/heimdal_build/wscript_build:      
> >               includes='../heimdal/lib/gssapi/gssapi
> > ../heimdal/lib/gssapi/spnego ../heimdal/lib/gssapi/krb5
> > ../heimdal/lib/gssapi/mech
> > ../heimdal/lib/ntlm',third_party/heimdal_build/wscript_build:      
> >                 includes='../heimdal/lib/krb5 ../heimdal/lib/asn1
> > ../heimdal/include',third_party/heimdal_build/wscript_build:       
> >                includes='../heimdal/include ../heimdal/lib/asn1
> > ../heimdal/lib/ipc',third_party/heimdal_build/wscript_build:       
> >  includes='../heimdal/lib/krb5
> > ../heimdal/include',third_party/heimdal_build/wscript_build:       
> >                  includes='../heimdal/lib/krb5 ../heimdal/lib/asn1
> > ../heimdal/include',third_party/heimdal_build/wscript_build:       
> >  includes='../heimdal/lib/asn1',third_party/heimdal_build/wscript_b
> > uild:                          includes='../heimdal/lib/hcrypto/lib
> > tommath'third_party/heimdal_build/wscript_build:        includes='.
> > ./heimdal/lib/hcrypto ../heimdal/lib
> > ../heimdal/include',third_party/heimdal_build/wscript_build:       
> >  includes='../heimdal/lib/base ../heimdal/include
> > ../heimdal/lib/krb5',third_party/heimdal_build/wscript_build:      
> >   includes='../heimdal/lib/base ../heimdal/lib/com_err
> > ../heimdal/include
> > ../heimdal/lib/krb5',third_party/heimdal_build/wscript_build:      
> >   includes='../heimdal/lib/asn1',third_party/heimdal_build/wscript_
> > build:        includes='../heimdal/lib/asn1',third_party/heimdal_bu
> > ild/wscript_build:        includes='../heimdal/lib/hx509',third_par
> > ty/heimdal_build/wscript_build:        source =
> > '../heimdal/lib/wind/gen-errorlist.py
> > ../heimdal/lib/wind/rfc3454.txt
> > ../heimdal/lib/wind/stringprep.py',third_party/heimdal_build/wscrip
> > t_build:        target = '../heimdal/lib/wind/errorlist_table.c
> > ../heimdal/lib/wind/errorlist_table.h'third_party/heimdal_build/wsc
> > ript_build:        source = '../heimdal/lib/wind/gen-normalize.py
> > ../heimdal/lib/wind/UnicodeData.txt
> > ../heimdal/lib/wind/CompositionExclusions-
> > 3.2.0.txt',third_party/heimdal_build/wscript_build:        target =
> > '../heimdal/lib/wind/normalize_table.h
> > ../heimdal/lib/wind/normalize_table.c'third_party/heimdal_build/wsc
> > ript_build:        source = '../heimdal/lib/wind/gen-combining.py
> > ../heimdal/lib/wind/UnicodeData.txt',third_party/heimdal_build/wscr
> > ipt_build:        target = '../heimdal/lib/wind/combining_table.h
> > ../heimdal/lib/wind/combining_table.c'third_party/heimdal_build/wsc
> > ript_build:        source = '../heimdal/lib/wind/gen-bidi.py
> > ../heimdal/lib/wind/rfc3454.txt',third_party/heimdal_build/wscript_
> > build:        target = '../heimdal/lib/wind/bidi_table.h
> > ../heimdal/lib/wind/bidi_table.c'third_party/heimdal_build/wscript_
> > build:        source = '../heimdal/lib/wind/gen-map.py
> > ../heimdal/lib/wind/stringprep.py
> > ../heimdal/lib/wind/rfc3454.txt',third_party/heimdal_build/wscript_
> > build:        target = '../heimdal/lib/wind/map_table.h
> > ../heimdal/lib/wind/map_table.c'third_party/heimdal_build/wscript_b
> > uild:          includes='../heimdal/lib/wind',third_party/heimdal_b
> > uild/wscript_build:        includes='../heimdal/lib/com_err',third_
> > party/heimdal_build/wscript_build:                      includes='.
> > ./heimdal/lib/asn1',third_party/heimdal_build/wscript_build:       
> >  includes='../heimdal/lib/asn1',third_party/heimdal_build/wscript_b
> > uild:        includes='../heimdal/lib/com_err',
> > 
> > > bld(source='../heimdal/lib/wind/gen-
> > > errorlist.py../heimdal/lib/wind/rfc3454.txt
> > > ../heimdal/lib/wind/stringprep.py',target=['../heimdal/lib/wind/e
> > > rrorlist_table.c','../heimdal/lib/wind/errorlist_table.h'],
> > > meths=['check_err_features','check_err_order', 'process_rule',
> > > 'process_source'],
> > > features=[],path=/home/nkadel/git/nkadel/samba4repo/samba-
> > > srpm/rpmbuild/BUILD/samba-
> > > 4.20.0rc2/third_party/heimdal_build,idx=106, tg_idx_count=2463,
> > > rule="${PYTHON} '${SRC[0].abspath()}''${SRC[1].abspath()}'
> > > '${SRC[1].parent.abspath(env)}'", shell=True,update_outputs=True,
> > > before='c', ext_out='.c', vars=["${PYTHON}'${SRC[0].abspath()}'
> > > '${SRC[1].abspath()}''${SRC[1].parent.abspath(env)}'"],
> > > samba_type='GENERATOR',_name='HEIMDAL_ERRORLIST', posted=True)
> > > in/home/nkadel/git/nkadel/samba4repo/samba-
> > > srpm/rpmbuild/BUILD/samba-
> > > 4.20.0rc2/third_party/heimdal_buildmake[1]: *** [Makefile:7: all]
> > > Error 1make[1]: Leaving
> > > directory'/home/nkadel/git/nkadel/samba4repo/samba-
> > > srpm/rpmbuild/BUILD/samba-4.20.0rc2'error: Bad exit status from
> > > /var/tmp/rpm-tmp.o6xbN7 (%build)
> > 
> > 
> > 
> > --/ Alexander Bokovoy
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



