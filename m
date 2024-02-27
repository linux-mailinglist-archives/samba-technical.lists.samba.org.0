Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D244868B68
	for <lists+samba-technical@lfdr.de>; Tue, 27 Feb 2024 09:56:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gcdoNlbNggnvmqfzaPsrl7Ws+3Vt/+1UUrQHP8umjKU=; b=jVzSve7GnoNpBMUf0kvTOIqbn1
	nO4SWWH+8GnIOyzDPB+EELwV8Jo3BhhPhLAMps8PJObqazdGeAKN36u/b0u7Cxc7wYzHE2TsTQNDs
	ok8srRpF/6dCIoE3iknB9EGc0tDfT7T8lzizBe4WwrPjFYtqqoQ4iv41Zpcw/fsk6lXexD1X8yxK/
	SWjdzFFuPBkagLinhs4lLYh9VjJyY4c3tOfb+r5LiovrIIGQjF0h54/7OlvylXU+jX0b5gqRwxp9h
	dD5UOc2Kzeu+Dc4RMfWRV7s9032X8yTQnhUaUyK7CDe1DX2TKIaTCV92OcxgjmPZfXccgeM1ItYLK
	SuzgvZkg==;
Received: from ip6-localhost ([::1]:18320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1retFD-009WPS-Uy; Tue, 27 Feb 2024 08:55:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25334) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1retF8-009WPL-OB
 for samba-technical@lists.samba.org; Tue, 27 Feb 2024 08:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gcdoNlbNggnvmqfzaPsrl7Ws+3Vt/+1UUrQHP8umjKU=; b=lYZP/7iGRRWlRkiu3HE/X3Reto
 30cCGCgeK9QYOiIIOt/2AIKlvBmsZfB/9kurSyq9orY5R5qRqxLh1M0gz3GKPuqc1ya7b4a5dI2vx
 7CbppaQosu0eXpRCSpm9rteHFTCmOjbOkDn8Naog6BhVUD4UGz4iRIrrVi4Y1ZaY6DJrCTwNY4Jnw
 YIQ71j0Kkx3yV4LvZmua0OjS1Ynjlml+G5uYNqirjQ3fu147kjg+G7x4oOv8BynWMINJu/4gIQI9d
 q0ZC1OKgCsiItL31OXKG9OF6QJ5rjf25gAFLbGBuqI75zNaQr9SJcviDtaN4hoz6eOwu9cWfGwms9
 PjgJRKPqdxbd245KGwc/RO88hIl77akjumrnuTweYqs+SPA6VQCZ7bZVBqgYgNdl2IFyCPxj4DvfW
 qLV+btwWv5eSrxSJeD+TQtIdvP308FqQPoXLQpmPaCI5cNRq0Z1KB/7v2A39ZcL8TaQyOVT4QInrK
 lT7To5R9EAf/eFqLdki17oZ2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1retF7-00F0zm-2n; Tue, 27 Feb 2024 08:55:17 +0000
Date: Tue, 27 Feb 2024 10:55:05 +0200
To: Nico Kadel-Garcia <nkadel@gmail.com>
Subject: Re: Samba 4.20.0rc2 fails to support "--with-includelibs" or build
 Heimdall Kerberos
Message-ID: <Zd2jaaIxgSWMiZ6f@toolbox>
References: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
 <ZdIU8U1tFrsf0Yi2@toolbox>
 <CAOCN9rwCGJOhK2EkCDJOeahbt7j1R5fNpbd+55rjrKrtCbqjtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCN9rwCGJOhK2EkCDJOeahbt7j1R5fNpbd+55rjrKrtCbqjtA@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Няд, 25 лют 2024, Nico Kadel-Garcia wrote:
> On Sun, Feb 18, 2024 at 9:29 AM Alexander Bokovoy <ab@samba.org> wrote:
> >
> > On Sun, 18 Feb 2024, Nico Kadel-Garcia via samba-technical wrote:
> > > I've been publishing backports of current Samba releases for RHEL to
> > > include full domain controller capability for a few years now. Red Hat
> > > elects to turn off the domain controller features at build time, and
> > > the Fedora SRPM's reflect this decision for RHEL. Building for RHEL
> > > meand activating "--with-includelibs" in order to avoid conflicts with
> > > the libldb, libtdb, etc. versons used by sssd and other default tools.
> > >
> > > My current work is published at https://github.com/nkadel/samba4repo/.
> > > When I enable the use of the built-in Heimdall Kerberos with the
> > > "system_mit_krb5" option in the .spec file, I get these errors when
> > > compiling Samba with the "mock" command.
> 
> [ log snipped ]
> 
> 
> > This just shows that systemd-nspawn execution failed when running
> > 'rpmbuild -bb ... samba.spec'. Are there are any more logs available?
> >
> > In particular, prior to
> >
> > > error: Bad exit status from /var/tmp/rpm-tmp.sarBcy (%build)
> > > RPM build errors:
> >
> > --
> > / Alexander Bokovoy
> 
> I normally do these builds with "mock". Working from a CentOS 8 system
> with more standard rpmbuild setup:
> 
> symlink: samba_downgrade_db -> ./samba_downgrade_db
> symlink: samba-tool -> ./samba-tool
> symlink: samba-gpupdate -> ./samba-gpupdate
> symlink: smbaddshare -> ./smbaddshare
> symlink: smbchangeshare -> ./smbchangeshare
> symlink: smbdeleteshare -> ./smbdeleteshare
> Checking project rules ...
> Project rules pass
> [1/1] Processing VERSION: VERSION buildtools/wafsamba/samba_version.py
> -> bin/default/version.h
> Waf: Leaving directory
> `/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.20.0rc2/bin/default'
> source not found: '../heimdal/lib/wind/gen-errorlist.py' in

^^ it did not find the gen-errorlist.py file.

It is now in ./third_party/heimdal/lib/wind/gen-errorlist.py while
before commit 7055827b8ffd3823c1240ba3f0b619dd6068cd51 it was in
./source4/heimdal/lib/wind/gen-errorlist.py:

------------------------------------------------------------------------------------
commit 7055827b8ffd3823c1240ba3f0b619dd6068cd51
Author: Stefan Metzmacher <metze@samba.org>
Date:   Wed Jan 19 13:15:45 2022 +0100

    HEIMDAL: move code from source4/heimdal* to third_party/heimdal*

    This makes it clearer that we always want to do heimdal changes
    via the lorikeet-heimdal repository.

    Signed-off-by: Stefan Metzmacher <metze@samba.org>
    Reviewed-by: Joseph Sutton <josephsutton@catalyst.net.nz>

    Autobuild-User(master): Joseph Sutton <jsutton@samba.org>
    Autobuild-Date(master): Wed Jan 19 21:41:59 UTC 2022 on sn-devel-184

(part of the commit 7055827b)
diff --git a/source4/heimdal/lib/wind/gen-errorlist.py b/third_party/heimdal/lib/wind/gen-errorlist.py
similarity index 100%
rename from source4/heimdal/lib/wind/gen-errorlist.py
rename to third_party/heimdal/lib/wind/gen-errorlist.py
------------------------------------------------------------------------------------

I suspect other locations using ../heimdal/ prefix would need to be
adjusted to use new location. These are mostly in

$ git grep '\.\./heimdal/'
third_party/heimdal_build/gssapi-glue.c:#include "../heimdal/lib/gssapi/gssapi_mech.h"
third_party/heimdal_build/hdb-glue.c:#include "../heimdal/lib/hdb/hdb_locl.h"
third_party/heimdal_build/krb5-glue.c:#include "../heimdal/lib/krb5/krb5_locl.h"
third_party/heimdal_build/krb5/kdc-plugin.h:#include "../../heimdal/kdc/kdc-plugin.h"
third_party/heimdal_build/roken.h:#include "../heimdal/lib/roken/roken.h.in"
third_party/heimdal_build/vis.h:#include "../heimdal/lib/roken/vis.hin"
third_party/heimdal_build/wscript_build:            source = '../heimdal/lib/roken/err.hin',
third_party/heimdal_build/wscript_build:            target = '../heimdal/lib/roken/err.h',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/roken ../heimdal/include ../heimdal_build/include',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/roken ../heimdal/include ../heimdal_build/include',
third_party/heimdal_build/wscript_build:                    includes='../heimdal/lib/gss_preauth',
third_party/heimdal_build/wscript_build:                        includes='../heimdal/kdc',
third_party/heimdal_build/wscript_build:                        includes='../heimdal/lib/ntlm',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/asn1')
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/hdb',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/hdb',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/asn1',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/asn1',
third_party/heimdal_build/wscript_build:                      includes='../heimdal/lib/gssapi/gssapi ../heimdal/lib/gssapi/spnego ../heimdal/lib/gssapi/krb5 ../heimdal/lib/gssapi/mech ../heimdal/lib/ntlm',
third_party/heimdal_build/wscript_build:                    includes='../heimdal/lib/gssapi/gssapi ../heimdal/lib/gssapi/spnego ../heimdal/lib/gssapi/krb5 ../heimdal/lib/gssapi/mech ../heimdal/lib/ntlm',
third_party/heimdal_build/wscript_build:                      includes='../heimdal/lib/krb5 ../heimdal/lib/asn1 ../heimdal/include',
third_party/heimdal_build/wscript_build:                      includes='../heimdal/include ../heimdal/lib/asn1 ../heimdal/lib/ipc',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/krb5 ../heimdal/include',
third_party/heimdal_build/wscript_build:                        includes='../heimdal/lib/krb5 ../heimdal/lib/asn1 ../heimdal/include',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/asn1',
third_party/heimdal_build/wscript_build:                          includes='../heimdal/lib/hcrypto/libtommath'
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/hcrypto ../heimdal/lib ../heimdal/include',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/base ../heimdal/include ../heimdal/lib/krb5',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/base ../heimdal/lib/com_err ../heimdal/include ../heimdal/lib/krb5',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/asn1',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/asn1',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/hx509',
third_party/heimdal_build/wscript_build:        source = '../heimdal/lib/wind/gen-errorlist.py ../heimdal/lib/wind/rfc3454.txt ../heimdal/lib/wind/stringprep.py',
third_party/heimdal_build/wscript_build:        target = '../heimdal/lib/wind/errorlist_table.c ../heimdal/lib/wind/errorlist_table.h'
third_party/heimdal_build/wscript_build:        source = '../heimdal/lib/wind/gen-normalize.py ../heimdal/lib/wind/UnicodeData.txt ../heimdal/lib/wind/CompositionExclusions-3.2.0.txt',
third_party/heimdal_build/wscript_build:        target = '../heimdal/lib/wind/normalize_table.h ../heimdal/lib/wind/normalize_table.c'
third_party/heimdal_build/wscript_build:        source = '../heimdal/lib/wind/gen-combining.py ../heimdal/lib/wind/UnicodeData.txt',
third_party/heimdal_build/wscript_build:        target = '../heimdal/lib/wind/combining_table.h ../heimdal/lib/wind/combining_table.c'
third_party/heimdal_build/wscript_build:        source = '../heimdal/lib/wind/gen-bidi.py ../heimdal/lib/wind/rfc3454.txt',
third_party/heimdal_build/wscript_build:        target = '../heimdal/lib/wind/bidi_table.h ../heimdal/lib/wind/bidi_table.c'
third_party/heimdal_build/wscript_build:        source = '../heimdal/lib/wind/gen-map.py ../heimdal/lib/wind/stringprep.py ../heimdal/lib/wind/rfc3454.txt',
third_party/heimdal_build/wscript_build:        target = '../heimdal/lib/wind/map_table.h ../heimdal/lib/wind/map_table.c'
third_party/heimdal_build/wscript_build:          includes='../heimdal/lib/wind',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/com_err',
third_party/heimdal_build/wscript_build:                      includes='../heimdal/lib/asn1',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/asn1',
third_party/heimdal_build/wscript_build:        includes='../heimdal/lib/com_err',


> bld(source='../heimdal/lib/wind/gen-errorlist.py
> ../heimdal/lib/wind/rfc3454.txt ../heimdal/lib/wind/stringprep.py',
> target=['../heimdal/lib/wind/errorlist_table.c',
> '../heimdal/lib/wind/errorlist_table.h'], meths=['check_err_features',
> 'check_err_order', 'process_rule', 'process_source'], features=[],
> path=/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.20.0rc2/third_party/heimdal_build,
> idx=106, tg_idx_count=2463, rule="${PYTHON} '${SRC[0].abspath()}'
> '${SRC[1].abspath()}' '${SRC[1].parent.abspath(env)}'", shell=True,
> update_outputs=True, before='c', ext_out='.c', vars=["${PYTHON}
> '${SRC[0].abspath()}' '${SRC[1].abspath()}'
> '${SRC[1].parent.abspath(env)}'"], samba_type='GENERATOR',
> _name='HEIMDAL_ERRORLIST', posted=True) in
> /home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.20.0rc2/third_party/heimdal_build
> make[1]: *** [Makefile:7: all] Error 1
> make[1]: Leaving directory
> '/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.20.0rc2'
> error: Bad exit status from /var/tmp/rpm-tmp.o6xbN7 (%build)




-- 
/ Alexander Bokovoy

