Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ACC169747
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 11:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=TU+HCGPaSU0QhFaHdfZyoPFlEawrHEaTqj1GIGtIkjY=; b=i3j+/gbNM6+JD65rwlOc4NDRDT
	YxXvEJMaDETIcK53RPceysXdbJ77X29jSPuQrIDrRtnb+toY8i90oMZeQL16uxaoemLkKWQrUmP+w
	limzqPT5+YMTfgeKq0Gju/ZP+tzKBqvgFTE5UM5nHXAkf6fpJVnoVEmf6FnQ6A/nkc9fw+n9nWEpz
	3MqBcRA3OauotcmyAhawa9kECAxTKqHDkuHhxNs3LUgcmy3HALBO64sDc1wJI6k9hnpocqJVK4gqM
	8+UY20o2HdBV/NM+F5LHOmFT+ngyUaJFbS/q7qSh4TNBeIbKUsKdG29ZUPEhCSqg3+976sgcxyeh9
	b86OBhyg==;
Received: from localhost ([::1]:24544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5oxf-00BANL-Lq; Sun, 23 Feb 2020 10:58:11 +0000
Received: from [80.20.169.36] (port=45471 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1j5oxa-00BANE-8o
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 10:58:09 +0000
Received: (qmail 18908 invoked by uid 121); 23 Feb 2020 11:31:22 +0100
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25731. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-101.7/5.0):. 
 Processed in 0.607355 secs); 23 Feb 2020 10:31:22 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 23 Feb 2020 11:31:21 +0100
Message-ID: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
Subject: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: Samba Technical <samba-technical@lists.samba.org>
Date: Sun, 23 Feb 2020 11:31:21 +0100
Organization: Solinos
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi, I'm doing some tests samba DC 4.12.rc3  MIT Kerberos  + Bind DNS +
Dhcpd script  on Fedora 32 beta.

All work fine except this issue:

The dhcp for a workstation "win10a.fedora.loc" NOT joined to domain
work great, name and reverse are added to Samba Bind DNS.

At this point I have Join the WS to domain without problem, I can login
on it with domain account and access to other network resource (win10b,
centos8 member server, ecc).

But after this join, some time (10/15 minutes) into syslog I get this
error:

named[718]: client @0x7f128c3e5eb0 192.168.122.103#54566: update
'fedora.loc/IN' denied
But despite this, everything works well

Whats means and how to resolve it?

Many thaks for your suggest.


Transaction  log with debug enabled into dhcp script during error
reporting :

feb 23 10:42:28 addc1.fedora.loc dhcpd[771]: Commit: IP:
192.168.122.103 DHCID: 52:54:00:8b:52:50 Name: win10afeb 23 10:42:28
addc1.fedora.loc dhcpd[771]: execute_statement argv[0] =
/usr/local/bin/dhcp-dyndns.shfeb 23 10:42:28 addc1.fedora.loc
dhcpd[771]: execute_statement argv[1] = addfeb 23 10:42:28
addc1.fedora.loc dhcpd[771]: execute_statement argv[2] =
192.168.122.103feb 23 10:42:28 addc1.fedora.loc dhcpd[771]:
execute_statement argv[3] = 52:54:00:8b:52:50feb 23 10:42:28
addc1.fedora.loc dhcpd[771]: execute_statement argv[4] = win10a
feb 23 10:42:28 addc1.fedora.loc audit[3654]: AVC avc:  denied  {
getattr } for  pid=3654 comm="wbinfo" path="/run/samba/winbindd/pipe"
dev="tmpfs" ino=27257 scontext=system_u:system_r:dhcpd_t:s0
tcontext=system_u:object_r:smbd_var_run_t:s0 tclass=sock_file
permissive=1feb 23 10:42:28 addc1.fedora.loc audit[3654]: AVC
avc:  denied  { write } for  pid=3654 comm="wbinfo" name="pipe"
dev="tmpfs" ino=27257 scontext=system_u:system_r:dhcpd_t:s0
tcontext=system_u:object_r:smbd_var_run_t:s0 tclass=sock_file
permissive=1(NOTE: selinux is permissive)

feb 23 10:42:28 addc1.fedora.loc dhcpd[3660]: 23-02-20 10:42:28
[dyndns] : Getting new ticket, old one has expiredfeb 23 10:42:28
addc1.fedora.loc dhcpd[3662]: Outgoing update query:feb 23 10:42:28
addc1.fedora.loc dhcpd[3662]: ;; ->>HEADER<<- opcode: QUERY, status:
NOERROR, id:  29837feb 23 10:42:28 addc1.fedora.loc dhcpd[3662]: ;;
flags:; QUESTION: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1feb 23
10:42:28 addc1.fedora.loc dhcpd[3662]: ;; QUESTION SECTION:feb 23
10:42:28 addc1.fedora.loc dhcpd[3662]: ;3538531543.sig-
addc1.fedora.loc. ANY        TKEYfeb 23 10:42:28 addc1.fedora.loc
dhcpd[3662]: ;; ADDITIONAL SECTION:feb 23 10:42:28 addc1.fedora.loc
dhcpd[3662]: 3538531543.sig-addc1.fedora.loc. 0
ANY        TKEY        gss-tsig. 1582450948 1582450948 3 NOERROR
1321 YIIFJQYJKoZIhvcSAQICAQBuggUUMIIFEKADAgEFoQMCAQ6iBwMFACAA
AACjggQLYYIEBzCCBAOgAwIBBaEMGwpGRURPUkEuTE9DoiIwIKADAgEB
oRkwFxsDRE5TGxBhZGRjMS5mZWRvcmEubG9jo4IDyDCCA8SgAwIBF6ED
AgEBooIDtgSCA7JsDBDE55V23YTpOqosfLEW1ZeufY7ELxGjOmaT2qjV
RLFRtMZoDawy8wKU7e1iRDF8b0g9PVhcBB3YS4hCjS3ncS0gAx9r4wOX
tD4J1JnCR9gh0dcahD/aKmYeJVYb5CKabVvpkWCKnpvUfDK1S5MHxSj+
TQO5UwyaBzp4amT3ycQy7Tiy3WwRM57gVJTQorKfwVdBMl6Gwlwva+nJ
W9ZC60Eco3JGXy11iE59V9J8b1FyvQUBoN+aQ/Huzla2zPShmyv50KS7
qnJMdLCHKuC0I6SwUADkOc+ElQIFNiwi/nix+Qn6uByZt2e8umzmliPg
zidAJvIP0YoSElPShBuQqvTetcEX7A5q42JZ1z1bXv1GbNRsM5YJIqio
rvy3aD/gOyiiN0Bt4rk04tZgNnc8JMedysmeZL1slU3yQ+bHt6TGKv9M
zMemCaCpchEHFPGUd88cTTsG20HaWwqf5+bbMresnQFiCYwJEaBvs4Tv
cgygMKwIIjR7vH/I2dYzLhEv7V4qQf7WxsRcGE2WfY03PWGoAEVdd2fp
z5DzAzweU4d3zj44rtmQmY/KfanC13m5ecla3lpgnWgxR66CxEk5nIPz
ByORgsccrtRCCNzSaKYKbdt8jHjEXev9ClnbjdBF1uvFkM2OeCELpk7m
VDBOE9o9HtDvlyPpk15fXkoJbdEFvEP68wegO5IGjcEeByIcFPEpEGQf
4dHJ8Fb4aIHGwc1OQhSyIWt1SjayMFhg0MlI+Pnh+Nv82hyr5Z9x2thO
jGnN4gVxwawQXxkJteDblPqatPk7QD8xfTRaSD276C+HZMnwJaS+cIsF
N5hV6mKPSxdSnroqy1Aq1iigHyNZqB6VOF0oXzFOIU00p9INVMzo6Cfo
ES2BNpfQgtk0sWkT+V0YK8hQ1FK9vhn9EnW+gWp+HafmKJLNVLei6k4V
o4+i7zL09NQt3TLD1M0aHw2F8FSyYI1y8NGSpc/Hq9TCujgJtuHbtHo3
WFZu6OR1iIy6A0nef1ei9iTEiyAsOhbLXzsx9cjZQv2HocwLzdBfg585
J6APXhOSoNKxts8ToAwySmNJHDXwweaW7RiggJrbHwnXoCdR/ng8rfMm
X/B0qyKD20uVU4oYPXLpokQGa2GKYIsik2HMY+eedKC2OCbUzw6JDmV3
oLvOe2ZOnobOPczmHJ/UnJpObXYdgYFVUZnpZz6PH8YWDIOazanvb5Fm
tzIsX7KNdvPOjKKPifczzvOGXb0Ydp9mnx8WhN2p6i16pIHrMIHooAMC
AReigeAEgd0ZYgfCtE2HvaTPp+xuMLbqLlbU3ujhDLQvTq2bCcERqhrA
0fuuVioj4xE2a/vNwRWhbtc9YEQV/sR/scs01cTs9V1JeqvNVtKKoRD1
fpMQohFXEs9sUXSvrs+kvvm7ckFrdi+VoY687uGu25GeIcvcLtYYoM8W
L/9okHRyVSjebXHsSU/ALdNhPeIigBOuxRG/YIKSHecqG2ZwDpKNRZyy
KBbrFUf8CiF4TdulLsZpc2xhz49ffTcbsqRQva47kgrRfJrDuqpWMznu
Uf8412G/BwNZecesJQwfELRUbg== 0feb 23 10:42:28 addc1.fedora.loc
dhcpd[3662]: Outgoing update query:feb 23 10:42:28 addc1.fedora.loc
dhcpd[3662]: ;; ->>HEADER<<- opcode: UPDATE, status: NOERROR,
id:  58051feb 23 10:42:28 addc1.fedora.loc dhcpd[3662]: ;; flags:;
ZONE: 1, PREREQ: 0, UPDATE: 2, ADDITIONAL: 1feb 23 10:42:28
addc1.fedora.loc dhcpd[3662]: ;; UPDATE SECTION:feb 23 10:42:28
addc1.fedora.loc dhcpd[3662]:
win10a.fedora.loc.        0        ANY        Afeb 23 10:42:28
addc1.fedora.loc dhcpd[3662]:
win10a.fedora.loc.        3600        IN        A        192.168.122.10
3feb 23 10:42:28 addc1.fedora.loc dhcpd[3662]: ;; TSIG
PSEUDOSECTION:feb 23 10:42:28 addc1.fedora.loc dhcpd[3662]:
3538531543.sig-addc1.fedora.loc. 0 ANY        TSIG        gss-tsig.
1582450948 300 28 BAQE//////8AAAAACCKfe3YlXBNeV6l5XOmsEA== 58051
NOERROR 0feb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz:
starting transaction on zone fedora.locfeb 23 10:42:28 addc1.fedora.loc
named[718]: samba_dlz: allowing update of signer=dhcpduser\@FEDORA.LOC
name=win10a.fedora.loc tcpaddr=127.0.0.1 type=A key=3538531543.sig-
addc1.fedora.loc/160/0feb 23 10:42:28 addc1.fedora.loc named[718]:
samba_dlz: allowing update of signer=dhcpduser\@FEDORA.LOC
name=win10a.fedora.loc tcpaddr=127.0.0.1 type=A key=3538531543.sig-
addc1.fedora.loc/160/0feb 23 10:42:28 addc1.fedora.loc named[718]:
client @0x7f128c3d6f00 127.0.0.1#41833/key dhcpduser\@FEDORA.LOC:
updating zone 'fedora.loc/NONE': deleting rrset at 'win10a.fedora.loc'
Afeb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz: subtracted
rdataset win10a.fedora.loc
'win10a.fedora.loc.        3600        IN        A        192.168.122.1
03'feb 23 10:42:28 addc1.fedora.loc named[718]: client @0x7f128c3d6f00
127.0.0.1#41833/key dhcpduser\@FEDORA.LOC: updating zone
'fedora.loc/NONE': adding an RR at 'win10a.fedora.loc' A
192.168.122.103feb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz:
added rdataset win10a.fedora.loc
'win10a.fedora.loc.        3600        IN        A        192.168.122.1
03'feb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz: committed
transaction on zone fedora.locfeb 23 10:42:28 addc1.fedora.loc
dhcpd[3666]: Outgoing update query:feb 23 10:42:28 addc1.fedora.loc
dhcpd[3666]: ;; ->>HEADER<<- opcode: QUERY, status: NOERROR,
id:  37493feb 23 10:42:28 addc1.fedora.loc dhcpd[3666]: ;; flags:;
QUESTION: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1feb 23 10:42:28
addc1.fedora.loc dhcpd[3666]: ;; QUESTION SECTION:feb 23 10:42:28
addc1.fedora.loc dhcpd[3666]: ;2854174941.sig-addc1.fedora.loc.
ANY        TKEYfeb 23 10:42:28 addc1.fedora.loc dhcpd[3666]: ;;
ADDITIONAL SECTION:feb 23 10:42:28 addc1.fedora.loc dhcpd[3666]:
2854174941.sig-addc1.fedora.loc. 0 ANY        TKEY        gss-tsig.
1582450948 1582450948 3 NOERROR 1321
YIIFJQYJKoZIhvcSAQICAQBuggUUMIIFEKADAgEFoQMCAQ6iBwMFACAA
AACjggQLYYIEBzCCBAOgAwIBBaEMGwpGRURPUkEuTE9DoiIwIKADAgEB
oRkwFxsDRE5TGxBhZGRjMS5mZWRvcmEubG9jo4IDyDCCA8SgAwIBF6ED
AgEBooIDtgSCA7JsDBDE55V23YTpOqosfLEW1ZeufY7ELxGjOmaT2qjV
RLFRtMZoDawy8wKU7e1iRDF8b0g9PVhcBB3YS4hCjS3ncS0gAx9r4wOX
tD4J1JnCR9gh0dcahD/aKmYeJVYb5CKabVvpkWCKnpvUfDK1S5MHxSj+
TQO5UwyaBzp4amT3ycQy7Tiy3WwRM57gVJTQorKfwVdBMl6Gwlwva+nJ
W9ZC60Eco3JGXy11iE59V9J8b1FyvQUBoN+aQ/Huzla2zPShmyv50KS7
qnJMdLCHKuC0I6SwUADkOc+ElQIFNiwi/nix+Qn6uByZt2e8umzmliPg
zidAJvIP0YoSElPShBuQqvTetcEX7A5q42JZ1z1bXv1GbNRsM5YJIqio
rvy3aD/gOyiiN0Bt4rk04tZgNnc8JMedysmeZL1slU3yQ+bHt6TGKv9M
zMemCaCpchEHFPGUd88cTTsG20HaWwqf5+bbMresnQFiCYwJEaBvs4Tv
cgygMKwIIjR7vH/I2dYzLhEv7V4qQf7WxsRcGE2WfY03PWGoAEVdd2fp
z5DzAzweU4d3zj44rtmQmY/KfanC13m5ecla3lpgnWgxR66CxEk5nIPz
ByORgsccrtRCCNzSaKYKbdt8jHjEXev9ClnbjdBF1uvFkM2OeCELpk7m
VDBOE9o9HtDvlyPpk15fXkoJbdEFvEP68wegO5IGjcEeByIcFPEpEGQf
4dHJ8Fb4aIHGwc1OQhSyIWt1SjayMFhg0MlI+Pnh+Nv82hyr5Z9x2thO
jGnN4gVxwawQXxkJteDblPqatPk7QD8xfTRaSD276C+HZMnwJaS+cIsF
N5hV6mKPSxdSnroqy1Aq1iigHyNZqB6VOF0oXzFOIU00p9INVMzo6Cfo
ES2BNpfQgtk0sWkT+V0YK8hQ1FK9vhn9EnW+gWp+HafmKJLNVLei6k4V
o4+i7zL09NQt3TLD1M0aHw2F8FSyYI1y8NGSpc/Hq9TCujgJtuHbtHo3
WFZu6OR1iIy6A0nef1ei9iTEiyAsOhbLXzsx9cjZQv2HocwLzdBfg585
J6APXhOSoNKxts8ToAwySmNJHDXwweaW7RiggJrbHwnXoCdR/ng8rfMm
X/B0qyKD20uVU4oYPXLpokQGa2GKYIsik2HMY+eedKC2OCbUzw6JDmV3
oLvOe2ZOnobOPczmHJ/UnJpObXYdgYFVUZnpZz6PH8YWDIOazanvb5Fm
tzIsX7KNdvPOjKKPifczzvOGXb0Ydp9mnx8WhN2p6i16pIHrMIHooAMC
AReigeAEgd2UGOSguRsAEJz1QDON81tu1nftlZ2kLUcE2FUd85P87kmV
qrpDxzyzOYd8cNVu+5UCD7/NCSgq9nYHFVeTGP59iM3cb+qAzzPJZroW
TNCHpaDP1InHvrPMQPIedzv8rS+Fj7HyTxNVxhz9hT8NjsX50DfbKv6t
WGGW+6A6Lu/71kepYAFqAS7YgmWT5p7S4TmeV2xoXbrAHAXn+5NiCfEo
qv0JPRxXptzVgJUveLTwglpeZprQUnGA/hSJq/ebfcUN2nbMPdxzhzHT
x4op5B2tvKoZzWCKPkQWJ+8WoA== 0feb 23 10:42:28 addc1.fedora.loc
dhcpd[3666]: Outgoing update query:feb 23 10:42:28 addc1.fedora.loc
dhcpd[3666]: ;; ->>HEADER<<- opcode: UPDATE, status: NOERROR,
id:  15214feb 23 10:42:28 addc1.fedora.loc dhcpd[3666]: ;; flags:;
ZONE: 1, PREREQ: 0, UPDATE: 2, ADDITIONAL: 1feb 23 10:42:28
addc1.fedora.loc dhcpd[3666]: ;; UPDATE SECTION:feb 23 10:42:28
addc1.fedora.loc dhcpd[3666]: 103.122.168.192.in-addr.arpa.
0        ANY        PTRfeb 23 10:42:28 addc1.fedora.loc dhcpd[3666]:
103.122.168.192.in-addr.arpa. 3600
IN        PTR        win10a.fedora.loc.feb 23 10:42:28 addc1.fedora.loc
dhcpd[3666]: ;; TSIG PSEUDOSECTION:feb 23 10:42:28 addc1.fedora.loc
dhcpd[3666]: 2854174941.sig-addc1.fedora.loc. 0
ANY        TSIG        gss-tsig. 1582450948 300 28
BAQE//////8AAAAAFb6HRG27UdYxcS0rfL9TSg== 15214 NOERROR 0feb 23 10:42:28
addc1.fedora.loc named[718]: samba_dlz: starting transaction on zone
122.168.192.in-addr.arpafeb 23 10:42:28 addc1.fedora.loc named[718]:
samba_dlz: allowing update of signer=dhcpduser\@FEDORA.LOC
name=103.122.168.192.in-addr.arpa tcpaddr=127.0.0.1 type=PTR
key=2854174941.sig-addc1.fedora.loc/160/0feb 23 10:42:28
addc1.fedora.loc named[718]: samba_dlz: allowing update of
signer=dhcpduser\@FEDORA.LOC name=103.122.168.192.in-addr.arpa
tcpaddr=127.0.0.1 type=PTR key=2854174941.sig-addc1.fedora.loc/160/0feb 
23 10:42:28 addc1.fedora.loc named[718]: client @0x7f128c040010
127.0.0.1#53767/key dhcpduser\@FEDORA.LOC: updating zone
'122.168.192.in-addr.arpa/NONE': deleting rrset at '103.122.168.192.in-
addr.arpa' PTRfeb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz:
subtracted rdataset 103.122.168.192.in-addr.arpa '103.122.168.192.in-
addr.arpa.        3600        IN        PTR        win10a.fedora.loc.'f
eb 23 10:42:28 addc1.fedora.loc named[718]: client @0x7f128c040010
127.0.0.1#53767/key dhcpduser\@FEDORA.LOC: updating zone
'122.168.192.in-addr.arpa/NONE': adding an RR at '103.122.168.192.in-
addr.arpa' PTR win10a.fedora.loc.feb 23 10:42:28 addc1.fedora.loc
named[718]: samba_dlz: added rdataset 103.122.168.192.in-addr.arpa
'103.122.168.192.in-
addr.arpa.        3600        IN        PTR        win10a.fedora.loc.'f
eb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz: committed
transaction on zone 122.168.192.in-addr.arpafeb 23 10:42:28
addc1.fedora.loc dhcpd[3670]: DHCP-DNS Update succeededfeb 23 10:42:28
addc1.fedora.loc dhcpd[771]: DHCPREQUEST for 192.168.122.103 from
52:54:00:8b:52:50 (win10a) via ens3feb 23 10:42:28 addc1.fedora.loc
dhcpd[771]: DHCPACK on 192.168.122.103 to 52:54:00:8b:52:50 (win10a)
via ens3feb 23 10:42:28 addc1.fedora.loc named[718]: samba_dlz:
starting transaction on zone fedora.locfeb 23 10:42:28 addc1.fedora.loc
named[718]: client @0x7f128d19cf40 192.168.122.103#52613: update
'fedora.loc/IN' deniedfeb 23 10:42:28 addc1.fedora.loc named[718]:
samba_dlz: cancelling transaction on zone fedora.loc
More details here:
https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/thread/N53AGBVBQMLIMXIA3DVVB7E3OD36OCRE/

-- 
Dario Lesca
(inviato dal mio Linux Fedora 31 Workstation)
