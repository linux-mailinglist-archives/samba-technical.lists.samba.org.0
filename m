Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D319417DCF1
	for <lists+samba-technical@lfdr.de>; Mon,  9 Mar 2020 11:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=juKW2gHk1ntR+dJ91lk1OGpMiBbsufDOOqT7tN3EjtI=; b=R/lznt/xgu4CjsQTazTL6/U+vM
	foix7iGIWvQ8y6jOVWnaIKHqD1eEau0nVROQ/rBxH4nG3EKKh4ZClR6i/1JsAgA8hu/Hac/8+Sdm4
	JMCOygVFwfaOBK9W+qYQESuNmMydR/ZSLc280IGuv52zxAytC8Yk8gPiKAPh40Ojphd2CIPJ5pYgi
	dNzKeLOpqNZzyWVezXQVR4Eh5wDVYIHnzZHHQuXa63jGN/r3yHpBVmT+vf4y7RssCWpxlrbx/TyOu
	a+TiNXGGWNTRbd1XfUf+eQCezFwAJc1H5dA3ZBn3jnPN5/pX/KpBtXaXgJTXOJBbZKaKFutcGWKo0
	RiHqI3dA==;
Received: from ip6-localhost ([::1]:33416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBFJo-00FU1e-J1; Mon, 09 Mar 2020 10:07:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBFJg-00FU1X-5L
 for samba-technical@lists.samba.org; Mon, 09 Mar 2020 10:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=juKW2gHk1ntR+dJ91lk1OGpMiBbsufDOOqT7tN3EjtI=; b=sN6cFrPxTw3sB37s8UJFC4QA13
 AZ8VSDR3wBqajqH8lzFficpXwSI/FybP5m4YNkIdn+3Uu2MIAm5ZwvQq/T5o1u/SCNUShEiJiXZNH
 0TbqHfItYgvRsSKVpBXwNphvFZV1gqSGsof7IlrNdkatI97+Ziv8V5KOrQtTpz/jsH7AhEYoYL5TF
 x+XbIPifNM0Big2ZV9WMUR2iMIvwhWT47wE8JKODePprx3WzbDKefDm0fB8Q+Y/P+NVwrmRHvSL2b
 YzyJ0k4RzftquIizAd/3+uDU+rMtLo/RPSUlfTqD7j0TjzwfeFcGBlrcHOTH9P5L5W531mlAwe2BA
 Vun8RQnJXLF6i7RUV6AUdSeiXAmjeS0TUE5n7n3IF5wQbNzAvORpq2wXmAdAyoPNQGyzq3mOAx5b/
 c7vqrD4SHtl1exGvZn4DBTqLLlnSvIsUnNA6zRNFsFZjqZiTIw8CSf+DVkeDAvlh9F2lyUVOTAB5W
 8LlSkMWN6mrN+Zp3TJzXdhFL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBFJe-0002Pk-8z; Mon, 09 Mar 2020 10:07:18 +0000
Date: Mon, 9 Mar 2020 12:07:15 +0200
To: Dario Lesca <d.lesca@solinos.it>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
Message-ID: <20200309100715.GK2735275@onega.vda.li>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On su, 23 helmi 2020, Dario Lesca via samba-technical wrote:
> Hi, I'm doing some tests samba DC 4.12.rc3  MIT Kerberos  + Bind DNS +
> Dhcpd script  on Fedora 32 beta.
> 
> All work fine except this issue:
> 
> The dhcp for a workstation "win10a.fedora.loc" NOT joined to domain
> work great, name and reverse are added to Samba Bind DNS.
> 
> At this point I have Join the WS to domain without problem, I can login
> on it with domain account and access to other network resource (win10b,
> centos8 member server, ecc).
> 
> But after this join, some time (10/15 minutes) into syslog I get this
> error:
> 
> named[718]: client @0x7f128c3e5eb0 192.168.122.103#54566: update
> 'fedora.loc/IN' denied
> But despite this, everything works well
> 
> Whats means and how to resolve it?

I think it is a missing feature in samba_dlz -- it has to provide SSU
table for the zone before SSU match callback could even be considered
called. However, samba_dlz does not provide one. Since it doesn't
provide one, you have to use native Bind ACL features.

Technical details:

In bin/named/update.c, update_action() code starts with:

        CHECK(dns_zone_getdb(zone, &db));
        zonename = dns_db_origin(db);
        zoneclass = dns_db_class(db);
        dns_zone_getssutable(zone, &ssutable);

        /*
         * Update message processing can leak record existance information
         * so check that we are allowed to query this zone.  Additionally
         * if we would refuse all updates for this zone we bail out here.
         */
        CHECK(checkqueryacl(client, dns_zone_getqueryacl(zone), zonename,
                            dns_zone_getupdateacl(zone), ssutable));

The message you see 'client ...: update ... denied' comes from
checkqueryacl()'s call:

...
       } else if (updateacl == NULL && ssutable == NULL) {
                dns_name_format(zonename, namebuf, sizeof(namebuf));
                dns_rdataclass_format(client->view->rdclass, classbuf,
                                      sizeof(classbuf));

                result = DNS_R_REFUSED;
                ns_client_log(client, NS_LOGCATEGORY_UPDATE_SECURITY,
                              NS_LOGMODULE_UPDATE, ISC_LOG_INFO,
                              "update '%s/%s' denied", namebuf, classbuf);
        }
...

So, both updateacl (result of call to dns_zone_getupdateacl(zone) above)
and ssutable are not there.

Since Samba's samba_dlz does not provide any dynamic handling of the
ACL, you need to add it manually in named.conf for your zone. See
https://www.zytrax.com/books/dns/ch7/xfer.html for examples.



> 
> Many thaks for your suggest.
> 
> 
> Transaction  log with debug enabled into dhcp script during error
> reporting :
> 
> feb 23 10:42:28 addc1.fedora.loc dhcpd[771]: Commit: IP:
> 192.168.122.103 DHCID: 52:54:00:8b:52:50 Name: win10afeb 23 10:42:28
> addc1.fedora.loc dhcpd[771]: execute_statement argv[0] =
> /usr/local/bin/dhcp-dyndns.shfeb 23 10:42:28 addc1.fedora.loc
> dhcpd[771]: execute_statement argv[1] = addfeb 23 10:42:28
> addc1.fedora.loc dhcpd[771]: execute_statement argv[2] =
> 192.168.122.103feb 23 10:42:28 addc1.fedora.loc dhcpd[771]:
> execute_statement argv[3] = 52:54:00:8b:52:50feb 23 10:42:28
> addc1.fedora.loc dhcpd[771]: execute_statement argv[4] = win10a
> feb 23 10:42:28 addc1.fedora.loc audit[3654]: AVC avc:  denied  {
> getattr } for  pid=3654 comm="wbinfo" path="/run/samba/winbindd/pipe"
> dev="tmpfs" ino=27257 scontext=system_u:system_r:dhcpd_t:s0
> tcontext=system_u:object_r:smbd_var_run_t:s0 tclass=sock_file
> permissive=1feb 23 10:42:28 addc1.fedora.loc audit[3654]: AVC
> avc:  denied  { write } for  pid=3654 comm="wbinfo" name="pipe"
> dev="tmpfs" ino=27257 scontext=system_u:system_r:dhcpd_t:s0
> tcontext=system_u:object_r:smbd_var_run_t:s0 tclass=sock_file
> permissive=1(NOTE: selinux is permissive)
> 
> feb 23 10:42:28 addc1.fedora.loc dhcpd[3660]: 23-02-20 10:42:28
> [dyndns] : Getting new ticket, old one has expiredfeb 23 10:42:28
> addc1.fedora.loc dhcpd[3662]: Outgoing update query:feb 23 10:42:28
> addc1.fedora.loc dhcpd[3662]: ;; ->>HEADER<<- opcode: QUERY, status:
> NOERROR, id:  29837feb 23 10:42:28 addc1.fedora.loc dhcpd[3662]: ;;
> flags:; QUESTION: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1feb 23
> 10:42:28 addc1.fedora.loc dhcpd[3662]: ;; QUESTION SECTION:feb 23
> 10:42:28 addc1.fedora.loc dhcpd[3662]: ;3538531543.sig-
> addc1.fedora.loc. ANY        TKEYfeb 23 10:42:28 addc1.fedora.loc
> dhcpd[3662]: ;; ADDITIONAL SECTION:feb 23 10:42:28 addc1.fedora.loc
> dhcpd[3662]: 3538531543.sig-addc1.fedora.loc. 0
> ANY        TKEY        gss-tsig. 1582450948 1582450948 3 NOERROR
> 1321 YIIFJQYJKoZIhvcSAQICAQBuggUUMIIFEKADAgEFoQMCAQ6iBwMFACAA
> AACjggQLYYIEBzCCBAOgAwIBBaEMGwpGRURPUkEuTE9DoiIwIKADAgEB
> oRkwFxsDRE5TGxBhZGRjMS5mZWRvcmEubG9jo4IDyDCCA8SgAwIBF6ED
> AgEBooIDtgSCA7JsDBDE55V23YTpOqosfLEW1ZeufY7ELxGjOmaT2qjV
> RLFRtMZoDawy8wKU7e1iRDF8b0g9PVhcBB3YS4hCjS3ncS0gAx9r4wOX
> tD4J1JnCR9gh0dcahD/aKmYeJVYb5CKabVvpkWCKnpvUfDK1S5MHxSj+
> TQO5UwyaBzp4amT3ycQy7Tiy3WwRM57gVJTQorKfwVdBMl6Gwlwva+nJ
> W9ZC60Eco3JGXy11iE59V9J8b1FyvQUBoN+aQ/Huzla2zPShmyv50KS7
> qnJMdLCHKuC0I6SwUADkOc+ElQIFNiwi/nix+Qn6uByZt2e8umzmliPg
> zidAJvIP0YoSElPShBuQqvTetcEX7A5q42JZ1z1bXv1GbNRsM5YJIqio
> rvy3aD/gOyiiN0Bt4rk04tZgNnc8JMedysmeZL1slU3yQ+bHt6TGKv9M
> zMemCaCpchEHFPGUd88cTTsG20HaWwqf5+bbMresnQFiCYwJEaBvs4Tv
> cgygMKwIIjR7vH/I2dYzLhEv7V4qQf7WxsRcGE2WfY03PWGoAEVdd2fp
> z5DzAzweU4d3zj44rtmQmY/KfanC13m5ecla3lpgnWgxR66CxEk5nIPz
> ByORgsccrtRCCNzSaKYKbdt8jHjEXev9ClnbjdBF1uvFkM2OeCELpk7m
> VDBOE9o9HtDvlyPpk15fXkoJbdEFvEP68wegO5IGjcEeByIcFPEpEGQf
> 4dHJ8Fb4aIHGwc1OQhSyIWt1SjayMFhg0MlI+Pnh+Nv82hyr5Z9x2thO
> jGnN4gVxwawQXxkJteDblPqatPk7QD8xfTRaSD276C+HZMnwJaS+cIsF
> N5hV6mKPSxdSnroqy1Aq1iigHyNZqB6VOF0oXzFOIU00p9INVMzo6Cfo
> ES2BNpfQgtk0sWkT+V0YK8hQ1FK9vhn9EnW+gWp+HafmKJLNVLei6k4V
> o4+i7zL09NQt3TLD1M0aHw2F8FSyYI1y8NGSpc/Hq9TCujgJtuHbtHo3
> WFZu6OR1iIy6A0nef1ei9iTEiyAsOhbLXzsx9cjZQv2HocwLzdBfg585
> J6APXhOSoNKxts8ToAwySmNJHDXwweaW7RiggJrbHwnXoCdR/ng8rfMm
> X/B0qyKD20uVU4oYPXLpokQGa2GKYIsik2HMY+eedKC2OCbUzw6JDmV3
> oLvOe2ZOnobOPczmHJ/UnJpObXYdgYFVUZnpZz6PH8YWDIOazanvb5Fm
> tzIsX7KNdvPOjKKPifczzvOGXb0Ydp9mnx8WhN2p6i16pIHrMIHooAMC
> AReigeAEgd0ZYgfCtE2HvaTPp+xuMLbqLlbU3ujhDLQvTq2bCcERqhrA
> 0fuuVioj4xE2a/vNwRWhbtc9YEQV/sR/scs01cTs9V1JeqvNVtKKoRD1
> fpMQohFXEs9sUXSvrs+kvvm7ckFrdi+VoY687uGu25GeIcvcLtYYoM8W
> L/9okHRyVSjebXHsSU/ALdNhPeIigBOuxRG/YIKSHecqG2ZwDpKNRZyy
> KBbrFUf8CiF4TdulLsZpc2xhz49ffTcbsqRQva47kgrRfJrDuqpWMznu
> Uf8412G/BwNZecesJQwfELRUbg== 0feb 23 10:42:28 addc1.fedora.loc
> dhcpd[3662]: Outgoing update query:feb 23 10:42:28 addc1.fedora.loc
> dhcpd[3662]: ;; ->>HEADER<<- opcode: UPDATE, status: NOERROR,
> id:  58051feb 23 10:42:28 addc1.fedora.loc dhcpd[3662]: ;; flags:;
> ZONE: 1, PREREQ: 0, UPDATE: 2, ADDITIONAL: 1feb 23 10:42:28
> addc1.fedora.loc dhcpd[3662]: ;; UPDATE SECTION:feb 23 10:42:28
> addc1.fedora.loc dhcpd[3662]:
> win10a.fedora.loc.        0        ANY        Afeb 23 10:42:28
> addc1.fedora.loc dhcpd[3662]:
> win10a.fedora.loc.        3600        IN        A        192.168.122.10
> 3feb 23 10:42:28 addc1.fedora.loc dhcpd[3662]: ;; TSIG
> PSEUDOSECTION:feb 23 10:42:28 addc1.fedora.loc dhcpd[3662]:
> 3538531543.sig-addc1.fedora.loc. 0 ANY        TSIG        gss-tsig.
> 1582450948 300 28 BAQE//////8AAAAACCKfe3YlXBNeV6l5XOmsEA== 58051
> NOERROR 0feb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz:
> starting transaction on zone fedora.locfeb 23 10:42:28 addc1.fedora.loc
> named[718]: samba_dlz: allowing update of signer=dhcpduser\@FEDORA.LOC
> name=win10a.fedora.loc tcpaddr=127.0.0.1 type=A key=3538531543.sig-
> addc1.fedora.loc/160/0feb 23 10:42:28 addc1.fedora.loc named[718]:
> samba_dlz: allowing update of signer=dhcpduser\@FEDORA.LOC
> name=win10a.fedora.loc tcpaddr=127.0.0.1 type=A key=3538531543.sig-
> addc1.fedora.loc/160/0feb 23 10:42:28 addc1.fedora.loc named[718]:
> client @0x7f128c3d6f00 127.0.0.1#41833/key dhcpduser\@FEDORA.LOC:
> updating zone 'fedora.loc/NONE': deleting rrset at 'win10a.fedora.loc'
> Afeb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz: subtracted
> rdataset win10a.fedora.loc
> 'win10a.fedora.loc.        3600        IN        A        192.168.122.1
> 03'feb 23 10:42:28 addc1.fedora.loc named[718]: client @0x7f128c3d6f00
> 127.0.0.1#41833/key dhcpduser\@FEDORA.LOC: updating zone
> 'fedora.loc/NONE': adding an RR at 'win10a.fedora.loc' A
> 192.168.122.103feb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz:
> added rdataset win10a.fedora.loc
> 'win10a.fedora.loc.        3600        IN        A        192.168.122.1
> 03'feb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz: committed
> transaction on zone fedora.locfeb 23 10:42:28 addc1.fedora.loc
> dhcpd[3666]: Outgoing update query:feb 23 10:42:28 addc1.fedora.loc
> dhcpd[3666]: ;; ->>HEADER<<- opcode: QUERY, status: NOERROR,
> id:  37493feb 23 10:42:28 addc1.fedora.loc dhcpd[3666]: ;; flags:;
> QUESTION: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1feb 23 10:42:28
> addc1.fedora.loc dhcpd[3666]: ;; QUESTION SECTION:feb 23 10:42:28
> addc1.fedora.loc dhcpd[3666]: ;2854174941.sig-addc1.fedora.loc.
> ANY        TKEYfeb 23 10:42:28 addc1.fedora.loc dhcpd[3666]: ;;
> ADDITIONAL SECTION:feb 23 10:42:28 addc1.fedora.loc dhcpd[3666]:
> 2854174941.sig-addc1.fedora.loc. 0 ANY        TKEY        gss-tsig.
> 1582450948 1582450948 3 NOERROR 1321
> YIIFJQYJKoZIhvcSAQICAQBuggUUMIIFEKADAgEFoQMCAQ6iBwMFACAA
> AACjggQLYYIEBzCCBAOgAwIBBaEMGwpGRURPUkEuTE9DoiIwIKADAgEB
> oRkwFxsDRE5TGxBhZGRjMS5mZWRvcmEubG9jo4IDyDCCA8SgAwIBF6ED
> AgEBooIDtgSCA7JsDBDE55V23YTpOqosfLEW1ZeufY7ELxGjOmaT2qjV
> RLFRtMZoDawy8wKU7e1iRDF8b0g9PVhcBB3YS4hCjS3ncS0gAx9r4wOX
> tD4J1JnCR9gh0dcahD/aKmYeJVYb5CKabVvpkWCKnpvUfDK1S5MHxSj+
> TQO5UwyaBzp4amT3ycQy7Tiy3WwRM57gVJTQorKfwVdBMl6Gwlwva+nJ
> W9ZC60Eco3JGXy11iE59V9J8b1FyvQUBoN+aQ/Huzla2zPShmyv50KS7
> qnJMdLCHKuC0I6SwUADkOc+ElQIFNiwi/nix+Qn6uByZt2e8umzmliPg
> zidAJvIP0YoSElPShBuQqvTetcEX7A5q42JZ1z1bXv1GbNRsM5YJIqio
> rvy3aD/gOyiiN0Bt4rk04tZgNnc8JMedysmeZL1slU3yQ+bHt6TGKv9M
> zMemCaCpchEHFPGUd88cTTsG20HaWwqf5+bbMresnQFiCYwJEaBvs4Tv
> cgygMKwIIjR7vH/I2dYzLhEv7V4qQf7WxsRcGE2WfY03PWGoAEVdd2fp
> z5DzAzweU4d3zj44rtmQmY/KfanC13m5ecla3lpgnWgxR66CxEk5nIPz
> ByORgsccrtRCCNzSaKYKbdt8jHjEXev9ClnbjdBF1uvFkM2OeCELpk7m
> VDBOE9o9HtDvlyPpk15fXkoJbdEFvEP68wegO5IGjcEeByIcFPEpEGQf
> 4dHJ8Fb4aIHGwc1OQhSyIWt1SjayMFhg0MlI+Pnh+Nv82hyr5Z9x2thO
> jGnN4gVxwawQXxkJteDblPqatPk7QD8xfTRaSD276C+HZMnwJaS+cIsF
> N5hV6mKPSxdSnroqy1Aq1iigHyNZqB6VOF0oXzFOIU00p9INVMzo6Cfo
> ES2BNpfQgtk0sWkT+V0YK8hQ1FK9vhn9EnW+gWp+HafmKJLNVLei6k4V
> o4+i7zL09NQt3TLD1M0aHw2F8FSyYI1y8NGSpc/Hq9TCujgJtuHbtHo3
> WFZu6OR1iIy6A0nef1ei9iTEiyAsOhbLXzsx9cjZQv2HocwLzdBfg585
> J6APXhOSoNKxts8ToAwySmNJHDXwweaW7RiggJrbHwnXoCdR/ng8rfMm
> X/B0qyKD20uVU4oYPXLpokQGa2GKYIsik2HMY+eedKC2OCbUzw6JDmV3
> oLvOe2ZOnobOPczmHJ/UnJpObXYdgYFVUZnpZz6PH8YWDIOazanvb5Fm
> tzIsX7KNdvPOjKKPifczzvOGXb0Ydp9mnx8WhN2p6i16pIHrMIHooAMC
> AReigeAEgd2UGOSguRsAEJz1QDON81tu1nftlZ2kLUcE2FUd85P87kmV
> qrpDxzyzOYd8cNVu+5UCD7/NCSgq9nYHFVeTGP59iM3cb+qAzzPJZroW
> TNCHpaDP1InHvrPMQPIedzv8rS+Fj7HyTxNVxhz9hT8NjsX50DfbKv6t
> WGGW+6A6Lu/71kepYAFqAS7YgmWT5p7S4TmeV2xoXbrAHAXn+5NiCfEo
> qv0JPRxXptzVgJUveLTwglpeZprQUnGA/hSJq/ebfcUN2nbMPdxzhzHT
> x4op5B2tvKoZzWCKPkQWJ+8WoA== 0feb 23 10:42:28 addc1.fedora.loc
> dhcpd[3666]: Outgoing update query:feb 23 10:42:28 addc1.fedora.loc
> dhcpd[3666]: ;; ->>HEADER<<- opcode: UPDATE, status: NOERROR,
> id:  15214feb 23 10:42:28 addc1.fedora.loc dhcpd[3666]: ;; flags:;
> ZONE: 1, PREREQ: 0, UPDATE: 2, ADDITIONAL: 1feb 23 10:42:28
> addc1.fedora.loc dhcpd[3666]: ;; UPDATE SECTION:feb 23 10:42:28
> addc1.fedora.loc dhcpd[3666]: 103.122.168.192.in-addr.arpa.
> 0        ANY        PTRfeb 23 10:42:28 addc1.fedora.loc dhcpd[3666]:
> 103.122.168.192.in-addr.arpa. 3600
> IN        PTR        win10a.fedora.loc.feb 23 10:42:28 addc1.fedora.loc
> dhcpd[3666]: ;; TSIG PSEUDOSECTION:feb 23 10:42:28 addc1.fedora.loc
> dhcpd[3666]: 2854174941.sig-addc1.fedora.loc. 0
> ANY        TSIG        gss-tsig. 1582450948 300 28
> BAQE//////8AAAAAFb6HRG27UdYxcS0rfL9TSg== 15214 NOERROR 0feb 23 10:42:28
> addc1.fedora.loc named[718]: samba_dlz: starting transaction on zone
> 122.168.192.in-addr.arpafeb 23 10:42:28 addc1.fedora.loc named[718]:
> samba_dlz: allowing update of signer=dhcpduser\@FEDORA.LOC
> name=103.122.168.192.in-addr.arpa tcpaddr=127.0.0.1 type=PTR
> key=2854174941.sig-addc1.fedora.loc/160/0feb 23 10:42:28
> addc1.fedora.loc named[718]: samba_dlz: allowing update of
> signer=dhcpduser\@FEDORA.LOC name=103.122.168.192.in-addr.arpa
> tcpaddr=127.0.0.1 type=PTR key=2854174941.sig-addc1.fedora.loc/160/0feb 
> 23 10:42:28 addc1.fedora.loc named[718]: client @0x7f128c040010
> 127.0.0.1#53767/key dhcpduser\@FEDORA.LOC: updating zone
> '122.168.192.in-addr.arpa/NONE': deleting rrset at '103.122.168.192.in-
> addr.arpa' PTRfeb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz:
> subtracted rdataset 103.122.168.192.in-addr.arpa '103.122.168.192.in-
> addr.arpa.        3600        IN        PTR        win10a.fedora.loc.'f
> eb 23 10:42:28 addc1.fedora.loc named[718]: client @0x7f128c040010
> 127.0.0.1#53767/key dhcpduser\@FEDORA.LOC: updating zone
> '122.168.192.in-addr.arpa/NONE': adding an RR at '103.122.168.192.in-
> addr.arpa' PTR win10a.fedora.loc.feb 23 10:42:28 addc1.fedora.loc
> named[718]: samba_dlz: added rdataset 103.122.168.192.in-addr.arpa
> '103.122.168.192.in-
> addr.arpa.        3600        IN        PTR        win10a.fedora.loc.'f
> eb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz: committed
> transaction on zone 122.168.192.in-addr.arpafeb 23 10:42:28
> addc1.fedora.loc dhcpd[3670]: DHCP-DNS Update succeededfeb 23 10:42:28
> addc1.fedora.loc dhcpd[771]: DHCPREQUEST for 192.168.122.103 from
> 52:54:00:8b:52:50 (win10a) via ens3feb 23 10:42:28 addc1.fedora.loc
> dhcpd[771]: DHCPACK on 192.168.122.103 to 52:54:00:8b:52:50 (win10a)
> via ens3feb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz:
> starting transaction on zone fedora.locfeb 23 10:42:28 addc1.fedora.loc
> named[718]: client @0x7f128d19cf40 192.168.122.103#52613: update
> 'fedora.loc/IN' deniedfeb 23 10:42:28 addc1.fedora.loc named[718]:
> samba_dlz: cancelling transaction on zone fedora.loc
> More details here:
> https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/thread/N53AGBVBQMLIMXIA3DVVB7E3OD36OCRE/
> 
> -- 
> Dario Lesca
> (inviato dal mio Linux Fedora 31 Workstation)

-- 
/ Alexander Bokovoy

