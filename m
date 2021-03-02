Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD2132A616
	for <lists+samba-technical@lfdr.de>; Tue,  2 Mar 2021 17:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NYgm/GvFcv9o2QAIr7R15gOvO70EydEdUWJg/PjIVNs=; b=0uFnmg0lue7pGgOqgCDZaBRkkj
	bRdUB5sgKxoq+hhddUiy/wPZlGdR0Q53u5DYkEiS9muf0xdXRRLU10Uu4gWxDslXSZYhCh2e6NGjG
	ajux2FSmU0btG8ypmi/KT/dnVL+wtz6Hb3ZatIY0H7wzDZvrUkb7j9BxzJW7Lk+epsTAIev99W/hI
	wgBl/cobZKtputKbny66H7y6Off2YWLnoA/NKd5rIKGBv/ZkviiBq9QRmZZb3tHisbi950qsfeXiA
	EC3X6HWTa54HjYsN4dp40Ax1CQ+E3bSo5tdsvMg3Ybh1ZQhqpH5K4awCI7o4rvX+obYnOr5MQwaIO
	iuipx4vA==;
Received: from ip6-localhost ([::1]:44814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lH7yi-003tTt-06; Tue, 02 Mar 2021 16:34:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lH7yb-003tTm-F3
 for samba-technical@lists.samba.org; Tue, 02 Mar 2021 16:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NYgm/GvFcv9o2QAIr7R15gOvO70EydEdUWJg/PjIVNs=; b=a71kEXER3ZVjaEiu+OA6c8yhLW
 ChZIdNA/gSm9FcJm6lRCbk3QKhMPlBbrSF7SYdsgGp1k33/Jo1dafic++Mw5VGMv8tib0rtOXHyar
 Bjpuz8Un8quQi4mHyB78+lUJ3htrc+yoiog9sp+t3GEHPEsIlGSquGpxxlBMATe8qZGppVhSkyH7T
 kWwX5urMZfKF/ST3yyEbIzU+wlQw3P/bmfXyz2G9cUDu03zTJivBelVJakMTDIudNKXWNVwmRkOVw
 7cHZKfgg+TExBqrF2WwGcqLrV2ypufTakPzox4xqxSldD/Yfq4S57n4pE1XuH8I2ATCjHCZ4x7sPw
 DjA9m/zqHgjSskAiMo7ZFvJzZDHCwPi51uczNrAIDTfrSjwzsMw5asYN2xJhFMFYTVnRrMdFrS5o4
 ovrc53hh11oghNPs+9tPC8dxcOT3VA9jQEK/UwYn4lPQL7nrfS/9Jg9nldPXH+TEG7iJ+n98RGsrw
 OHk0GCG5edV9ahcocOb1ABgn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lH7ya-0008Ga-Gm; Tue, 02 Mar 2021 16:34:24 +0000
Date: Tue, 2 Mar 2021 18:34:23 +0200
To: Vikram Bharti <vikrambharti33@gmail.com>
Subject: Re: Kerberos Constrained Delegation in libsmbclient
Message-ID: <20210302163423.GC5029@pinega.vda.li>
References: <CAH_vq2Hx+RzJoudmxcECe0PXG7uGvydzJceWm2nMEX0C5naV6w@mail.gmail.com>
 <20210224182956.GC1333267@jeremy-acer>
 <CAH_vq2HzC9T8FNc7khndkPa_uOTxOh9B94sU7TiN5zn0G3Ssmw@mail.gmail.com>
 <CAH_vq2GPk+tKkc2UWLYPA1KyW5j7KjWbg373jNi8397a2n=wVw@mail.gmail.com>
 <20210302125421.GA5029@pinega.vda.li>
 <CAH_vq2F5SQnfCEZ3ydpPFOPZUik0AF=NPYAO07CUVBv-7CaeTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH_vq2F5SQnfCEZ3ydpPFOPZUik0AF=NPYAO07CUVBv-7CaeTg@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

(resending to the list as Vikram responded personally and this is really
a public service).

On ti, 02 maalis 2021, Vikram Bharti wrote:
> Can you explain to me the input supplied to the FreeIPA? Ideally, the
> credential API should take the service credential (service user, and
> password) and the user principal name ( For whom the user level
> impersonation should be done ) and provide the appropriate token. Which
> can  allow the user to access SMB shares

Typically, you have an application that accepts incoming connection
authenticated with GSSAPI and then performs own backend operation
authenticated by GSSAPI on behalf of the user. It is mostly transparent
to the application -- in case of FreeIPA we rely on both Samba and
CyrusSASL doing their job as we talk to smbd and to LDAP server from a
wsgi application.

I have an older blog about it for FreeIPA which describes how another
application can achieve that:
https://vda.li/en/posts/2013/07/29/Setting-up-S4U2Proxy-with-FreeIPA/

Since this blog was published, FreeIPA tools gained ability to operate
delegation targets ('ipa help servicedelegation'), so configuring became
easier. We also moved to mod_auth_gssapi, so for Apache configuration
would look differently.

Anyway, I hacked up a small WSI program that runs 

 smbclient -k -L <hostname>

on IPA master, reusing existing delegation configuration for
HTTP/master.ipa.test to delegate to cifs/master.ipa.test. When accessed
with Kerberos authentication, this program just works and generates
expected output. Since it is running under unprivileged user, it has no
permissions to write to /var/lib/samba and to /, so errors for those are
expected.

 ipa: DEBUG: WSGI wsgi_dispatch.__call__:
 ipa: DEBUG: WSGI jsonserver.__call__:
 ipa: DEBUG: KerberosWSGIExecutioner.__call__:
 ipa: DEBUG: Created connection context.ldap2_139985529006512
 ipa: DEBUG: WSGI WSGIExecutioner.__call__:
 ipa: DEBUG: Starting external process
 ipa: DEBUG: args=['/usr/bin/smbclient', '-k', '-L', 'master.ipa.test']
 ipa: DEBUG: Process finished, return code=0
 ipa: DEBUG: stdout=
 \tSharename       Type      Comment
 \t---------       ----      -------
 \tIPC$            IPC       IPC Service (Samba 4.13.3)
 SMB1 disabled -- no workgroup available
 
 ipa: DEBUG: stderr=regdb_init: Failed to open registry /var/lib/samba/registry.tdb (Permission denied)
 Failed to initialize the registry: WERR_ACCESS_DENIED
 error initializing registry configuration: SBC_ERR_BADFILE
 /usr/bin/smbclient: Can't load /etc/samba/smb.conf - run testparm to debug it
 gencache_init: Failed to create directory: //.cache/samba - No such file or directory
 gencache_init: Failed to create directory: //.cache/samba - No such file or directory
 gencache_init: Failed to create directory: //.cache/samba - No such file or directory
 
 ipa: DEBUG: Destroyed connection context.ldap2_139985529006512


In samba logs for this connection I can see that smbclient authenticated
to smbd with Kerberos and that PAC content includes delegated
credentials:

[2021/03/02 11:23:55.626509,  3, pid=15285, effective(0, 0), real(0, 0), class=auth] ../../auth/kerberos/kerberos_pac.c:415(kerberos_decode_pac)
  Found account name from PAC: admin [Administrator]
[2021/03/02 11:23:55.626537, 10, pid=15285, effective(0, 0), real(0, 0), class=auth] ../../auth/kerberos/kerberos_pac.c:417(kerberos_decode_pac)
  Successfully validated Kerberos PAC
      pac_data: struct PAC_DATA
      [ ...... ]
              buffers: struct PAC_BUFFER
                  type                     : PAC_TYPE_UPN_DNS_INFO (12)
                  _ndr_size                : 0x00000040 (64)
                  info                     : *
                      info                     : union PAC_INFO(case 12)
                      upn_dns_info: struct PAC_UPN_DNS_INFO
                          upn_name_size            : 0x001c (28)
                          upn_name                 : *
                              upn_name                 : 'admin@IPA.TEST'
                          dns_domain_name_size     : 0x0010 (16)
                          dns_domain_name          : *
                              dns_domain_name          : 'IPA.TEST'
                          flags                    : 0x00000001 (1)
                                 1: PAC_UPN_DNS_FLAG_CONSTRUCTED
                  _pad                     : 0x00000000 (0)
              buffers: struct PAC_BUFFER
                  type                     : PAC_TYPE_CONSTRAINED_DELEGATION (11)
                  _ndr_size                : 0x000000c0 (192)
                  info                     : *
                      info                     : union PAC_INFO(case 11)
                      constrained_delegation: struct PAC_CONSTRAINED_DELEGATION_CTR
                          info                     : *
                              info: struct PAC_CONSTRAINED_DELEGATION
                                  proxy_target: struct lsa_String
                                      length                   : 0x003a (58)
                                      size                     : 0x003a (58)
                                      string                   : *
                                          string                   : 'HTTP/master.ipa.test@IPA.TEST'
                                  num_transited_services   : 0x00000001 (1)
                                  transited_services       : *
                                      transited_services: ARRAY(1)
                                          transited_services: struct lsa_String
                                              length                   : 0x003a (58)
                                              size                     : 0x003a (58)
                                              string                   : *
                                                  string                   : 'cifs/master.ipa.test@IPA.TEST'
                  _pad                     : 0x00000000 (0)


In short, I do not see any need to add something to libsmbclient to
enable constrained delegation. When you have properly set up
environment, it will just work correctly.

A properly set up environment includes:

- an application that accepts authenticated GSSAPI connections and has
  own Kerberos credentials available (in a keytab, for example)

- constrained delegation configuration is enabled for this application's
  Kerberos service by the KDC


> 
> On Tue, Mar 2, 2021 at 6:24 PM Alexander Bokovoy <ab@samba.org> wrote:
> 
> > On ti, 02 maalis 2021, Vikram Bharti via samba-technical wrote:
> > > Any further help would be appreciated.
> >
> > As far as I can see, libsmbclient internally uses credentials API which
> > means it already should support constraint delegation.
> >
> > I am not using libsmbclient for this use case myself but in FreeIPA we
> > are relying on Samba Python bindings for constraint delegation-based
> > access to LSA RPC and we have no problem with credentials API.
> >
> >
> > >
> > > On Thu, Feb 25, 2021 at 5:28 PM Vikram Bharti <vikrambharti33@gmail.com>
> > > wrote:
> > >
> > > > IMO KCD can take service user, password/keytab-file, UPN of
> > impersonation
> > > > user, and SPN of service as inputs  (probably in auth_callback)
> > > > or it can take final service ticket (TGS-REP) as input in
> > auth_callback.
> > > > Not so sure what should be right the way but I leave it up to you
> > decide if
> > > > these 2 are feasible or if there is a better way.
> > > >
> > > >
> > > >
> > > > On Thu, Feb 25, 2021 at 12:00 AM Jeremy Allison <jra@samba.org> wrote:
> > > >
> > > >> On Wed, Feb 24, 2021 at 05:29:37PM +0530, Vikram Bharti via
> > > >> samba-technical wrote:
> > > >> >Hi ,
> > > >> >
> > > >> >I was exploring a way to get KCD work with libsmbclient APIs and i
> > see
> > > >> >libsmbclient supports Kerberos auth but can't find any API for
> > > >> >impersonation and delegation.
> > > >> >Pls let me know if there is a way to get it done.
> > > >>
> > > >> No, this is not currently available in the libsmbclient API's.
> > > >>
> > > >> Can you give an example of what you'd like this to look like,
> > > >> so we can assess how hard it would be to implement ?
> > > >>
> > > >
> >
> > --
> > / Alexander Bokovoy
> >


-- 
/ Alexander Bokovoy

