Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED95C683
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 03:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=j23+oGsjf2NjeodMk0bmIK71jhPBgAxoUeN0IXzXYXs=; b=sU6WbjQgCnNwuBOyaKHWc1i+eI
	n1rR1/QgfCATk2aNNlWLxG5Gh7/D+aOqGkrIlWnecuxoEw/MD0gWBSRq2Hy6eSlq8p6mdCrFOIk13
	oyYz0tFg8y5LPDuMseATDdi//lyYE4C8J1GANaJko/fVUTaryjpdJm0tksi1KpN+S+CpZBHnZYPCt
	Mnv8UkfwtGLopBHtGRuUuEnvb85ykxqkXE1RYymsjnZyKdTT93JD0wCYly5VZ89Qv9ay9EgRZLcpr
	JFc2SK454yQ2dVENTR8HMauWkL6PPh/F1Dq359n/VqweSRPNBHdZI4r7Lti2T5Zwev1flLy1yfpq+
	2k6j9wgA==;
Received: from localhost ([::1]:41546 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hi7KL-004M8D-V3; Tue, 02 Jul 2019 01:11:22 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38679 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hi7KG-004M86-Pl
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 01:11:19 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45d5lv2G5Jz9s00;
 Tue,  2 Jul 2019 11:11:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1562029867; bh=jDsL54iYWl42Ivm5J8oDaz+hxwv3dExpUhMQ+6qGDJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ruwvmtPZIfyJcQuZbotAkQGsxKNqfJNKIDyUW/Hpq9Q3NzjyMysqJdMpTt+kNsRe4
 /ahF94Xvt+eICEQm4G0/MJsKNCEHVm67l/gqv0gi5tTaWgumpPIhpFoSJxinRh/BDj
 a8MmPBkOKKSHZq+CbMZcznzqHWV+wgyyDicwHVSaHjMeOCNBlGdY5TQ417WtGy2T4G
 /MA7SzZCSuBA3tNSBnajrmskL9HJM5j9AOqshAF2agFGjCrMAqZWGMLMVtaf++LqIF
 GzOfXbK1salpzoVEIEhJuQPtSITy1HH47vb/N+QwJEDo38FstwtGtYK3MV+qvBtviD
 klZiGgLsh8nlQ==
Date: Tue, 2 Jul 2019 11:11:02 +1000
To: Christof Schmitt <cs@samba.org>
Subject: Re: Compiling Samba with system Heimdal?
Message-ID: <20190702111103.5be8bc8f@martins.ozlabs.org>
In-Reply-To: <20190628211045.GA16917@samba.org>
References: <20190628142946.7537edfd@martins.ozlabs.org>
 <20190628211045.GA16917@samba.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Christof,

On Fri, 28 Jun 2019 14:10:46 -0700, Christof Schmitt <cs@samba.org>
wrote:

> On Fri, Jun 28, 2019 at 02:29:46PM +1000, Martin Schwenke via samba-technical wrote:
> > I'm trying to build Samba with system Heimdal on Debian testing...
> > 
> > $ CFLAGS="-O3" ./configure --picky-developer --abi-check-disable \
> >     --without-ad-dc  --without-json \
> >     --with-system-heimdalkrb5
> > ...
> > 'configure' finished successfully (1m1.668s)
> > 
> > $ make
> > [184/187] Compiling source4/heimdal_build/version.c
> > [185/187] Compiling source4/heimdal/lib/vers/print_version.c
> > In file included from ../../source4/heimdal_build/roken.h:156,
> >                  from ../../source4/heimdal/lib/vers/print_version.c:39:
> > ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error: roken-common.h: No such file or directory
> >  #include <roken-common.h>
> >           ^~~~~~~~~~~~~~~~
> > compilation terminated.
> > 
> > Waf: Leaving directory `/home/martins/samba/samba/bin/default'
> > Build failed  
> >  -> task in 'HEIMDAL_VERS_HOSTCC' failed with exit status 1 (run with -v to display more information)  
> > make: *** [Makefile:7: all] Error 1  
> 
> Hi Martin,
> 
> i see the same also on Ubuntu 18.04. Samba 4.10 has the same problem,
> Samba 4.9 compiles. 4.10 started using Python3 for the build. Then i
> came across this comment from metze, that there might be a problem with
> parsing the output of krb5-config with Python3:
> 
> commit 8061983d4882f3ba3f12da71443b035d7b672eec
> Author: Stefan Metzmacher <metze@samba.org>
> Date:   Thu Jan 24 02:31:10 2019 +0100
> 
>     wscript: separate embedded_heimdal from system_heimdal
>     
>     This allows to default (embedded_heimdal) to build even with a
>     broken krb5-config file from Heimdal.
>     
>     In the system_heimdal case we parse the content of krb5-config
>     instead of just executing it. This fails on FreeBSD 12 as
>     krb5-config contains iso-8859-1 characters, which can't be parsed
>     as unicode python buffers when using python3.
>     
>     Fixing the system_heimdal case is a task for another day,
>     I guess it will only work once we imported a current heimdal version
>     and actually tested the system_heimdal case.
>     
>     Signed-off-by: Stefan Metzmacher <metze@samba.org>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> I am not sure if that is the exact problem, but it would seem worthwhile
> to look closer in that area.

Thanks for this idea.

Unfortunately, the problem doesn't seem to be iso-8859-1 characters
that can't be parsed using python3.

I hacked wscript_configure_system_heimdal to grep the desired lines
of krb5-config.heimdal and then read only those lines in Python.  This
avoids any non-ASCII characters.  However, the same
bin/c4che/default_cache.py file is produced with or without the hack.

On my Debian testing system I see:

  $ file /usr/bin/krb5-config.heimdal 
  /usr/bin/krb5-config.heimdal: POSIX shell script, UTF-8 Unicode text executable

compared with:

  $ file /usr/bin/krb5-config.mit 
  /usr/bin/krb5-config.mit: POSIX shell script, ASCII text executable

So, I don't think the iso-8859-1 character problem exists on my system.

I don't think my problem is that I have both kerberos flavours
installed.  wscript_configure_system_heimdal explicitly looks for
krb5-config.heimdal.  When I saw this problem 6 months ago I didn't
have MIT kerberos installed.

Potentially relevant lines from default_cache.py are:

CFLAGS_roken = []
CPPPATH_ASN1 = ['/usr/include/heimdal']
CPPPATH_COM_ERR = ['/usr/include/heimdal']
CPPPATH_GSSAPI = ['/usr/include/heimdal']
CPPPATH_HCRYPTO = ['/usr/include/heimdal']
CPPPATH_HDB = ['/usr/include/heimdal']
CPPPATH_HEIMBASE = ['/usr/include/heimdal']
CPPPATH_HEIMNTLM = ['/usr/include/heimdal']
CPPPATH_HX509 = ['/usr/include/heimdal']
CPPPATH_KDC = ['/usr/include/heimdal']
CPPPATH_KRB5 = ['/usr/include/heimdal']
CPPPATH_ROKEN = ['/usr/include/heimdal']
CPPPATH_ROKEN_HOSTCC = ['/usr/include/heimdal']
CPPPATH_WIND = ['/usr/include/heimdal']
FOUND_SYSTEMLIB_roken = True
HAVE_LIBROKEN = 1
HAVE_ROKEN_H = 1
HEIMDAL_KRB5_CONFIG = ['/usr/bin/krb5-config.heimdal']
HEIMDAL_KRB5_TYPES_PATH = '/usr/include/heimdal/krb5-types.h'
LDFLAGS_roken = ['-lpthread', '-Wl,-no-undefined']
LIBPATH_ASN1 = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_COM_ERR = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_GSSAPI = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_HCRYPTO = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_HDB = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_HEIMBASE = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_HEIMNTLM = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_HX509 = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_KDC = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_KRB5 = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_ROKEN = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_ROKEN_HOSTCC = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIBPATH_WIND = ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-linux-gnu/mit-krb5']
LIB_ROKEN = 'roken'
LIB_ROKEN_HOSTCC = 'roken'
LIB_roken = ['roken']
SAMBA4_USES_HEIMDAL = 1
SYSTEM_LIBS = ('heimdal', 'asn1', 'com_err', 'roken', 'hx509', 'wind', 'gssapi', 'hcrypto', 'krb5', 'heimbase', 'asn1_compile', 'compile_et', 'kdc', 'hdb', 'heimntlm')
TARGET_TYPE = {'inotify': 'EMPTY', 'tirpc': 'EMPTY', 'nsl': 'SYSLIB', 'socket': 'EMPTY', 'bsd': 'SYSLIB', 'setproctitle': 'EMPTY', 'attr': 'EMPTY', 'dl': 'SYSLIB', 'rt': 'SYSLIB', 'resolv': 'SYSLIB', 'intl': 'EMPTY', 'pthread': 'SYSLIB', 'crypt': 'SYSLIB', 'popt': 'SYSLIB', 'z': 'SYSLIB', 'pam': 'SYSLIB', 'com_err': 'SYSLIB', 'roken': 'SYSLIB', 'ROKEN_HOSTCC': 'SYSLIB', 'wind': 'SYSLIB', 'hx509': 'SYSLIB', 'asn1': 'SYSLIB', 'heimbase': 'SYSLIB', 'hcrypto': 'SYSLIB', 'krb5': 'SYSLIB', 'gssapi': 'SYSLIB', 'heimntlm': 'SYSLIB', 'hdb': 'SYSLIB', 'kdc': 'SYSLIB', 'gnutls': 'SYSLIB', 'gpgme': 'EMPTY', 'execinfo': 'EMPTY', 'systemd-daemon': 'EMPTY', 'systemd-journal': 'EMPTY', 'systemd': 'SYSLIB', 'lttng-ust': 'EMPTY', 'iconv': 'EMPTY', 'ncurses': 'SYSLIB', 'readline': 'EMPTY', 'jansson': 'EMPTY', 'inet': 'EMPTY', 'archive': 'SYSLIB', 'dm': 'EMPTY', 'jfsdm': 'EMPTY', 'dmapi': 'EMPTY', 'xdsm': 'EMPTY', 'cap': 'EMPTY', 'sunacl': 'EMPTY', 'acl': 'SYSLIB', 'cups': 'EMPTY', 'lber': 'SYSLIB', 'ld
 ap': 'SYSLIB', 'avahi-client': 'EMPTY', 'avahi-common': 'EMPTY', 'sendfile': 'EMPTY', 'gen': 'EMPTY', 'security': 'EMPTY', 'sec': 'EMPTY', 'gfapi': 'EMPTY', 'menu': 'SYSLIB', 'panel': 'SYSLIB', 'form': 'SYSLIB', 'crypto': 'SYSLIB', 'glib-2.0': 'SYSLIB', 'nscd': 'EMPTY', 'util': 'SYSLIB', 'pcap': 'EMPTY', 'libtasn1': 'SYSLIB'}
USING_SYSTEM_ROKEN = 1


Despite all of those lovely variables containing
"/usr/include/heimdal", I don't see that in the compilation command.

In fact, as-per Andrew's comment a year ago, I'm guessing that we
shouldn't even be trying to build anything in source4/heimdal/.
However, it isn't as simple as commenting out

  bld.RECURSE('source4/heimdal_build')

in wscript_build_system_heimdal as is done in
wscript_build_system_mitkrb5.  That results in:

  Unknown dependency 'gssapi_krb5' in 'KRB5_PAC'

... and then I'm too far into dependencies that I don't understand well
enough to unravel.  :-(

peace & happiness,
martin

