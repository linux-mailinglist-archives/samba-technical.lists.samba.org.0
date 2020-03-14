Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E711855E5
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 16:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6b0TZ+UfdOKgHpRTyYsAPCAcihNCuax/sbxov2WNdpc=; b=mlGRY6GDp+4Peld+RcvgsTqzd9
	ti8sQDlTB19xW5+6rHJc+pwKxLg7BchBlxg6GyCpiwP3ueuBeF5s1s3u+2Fu3jFHRUu4jS+aK9kzd
	ZkvLQdK+ZNFLKb0RVn9jJLRdyBDTY5w8sjDGVB1toVUu6ZtT5sAd4kbeXj4AIyB6PlUq6l/sguahg
	fSjlSg4TAIR4lNkDYopcxkIxa2wyqbti54i62Vyoc/45wqt1/JXVH5SUY4PsLS4XxuYBwNKDHL7vV
	T5IsklxfCYtX1DAc4e9AEtvCWZN0XC81zKcYgSwrkG6WjLOZd2Yc0mln4w0sVxhkBRmun2me3nXrT
	S7EwQoXQ==;
Received: from ip6-localhost ([::1]:50486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jD8do-00G5jw-CH; Sat, 14 Mar 2020 15:23:56 +0000
Received: from [80.20.169.36] (port=54207 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1jD8di-00G5jp-Hx
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 15:23:53 +0000
Received: (qmail 3858 invoked by uid 121); 14 Mar 2020 16:23:46 +0100
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25750. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.248707 secs); 14 Mar 2020 15:23:46 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 14 Mar 2020 16:23:46 +0100
Message-ID: <2ee4998776b6d690b9f458cdfca7c11626e86784.camel@solinos.it>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
Date: Sat, 14 Mar 2020 16:23:45 +0100
In-Reply-To: <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
 <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
 <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
Organization: Solinos
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Il giorno sab, 14/03/2020 alle 14.15 +0000, Rowland penny via samba-
technical ha scritto:

Thanks Rowland, forgive me if I can't understand, but...

> the Computers A record should be added the first  time Samba is 
> run.
The A record is added into DNS zone only "first time Samba is run" 
or also whenever when I join a Computer to domain ?

> Starting Samba should cause samba_dnsupdate to run, this uses a 
> file called dns_update_list and right at the top of that is this:
> 
> # this is a list of DNS entries which will be put into DNS using
> # dynamic DNS update. It is processed by the samba_dnsupdate script
> A ${HOSTNAME}                                           $IP
> AAAA ${HOSTNAME}                                           $IP
> 
>  From my reading, it is this that should add the record if it is
> missing.

I have restart Samba many times but none of the missing Computer name
present into Samba Computer list are been added into DNS zone

and then, how does it traslate Computer list into DNS, if the IP of
computer in Computer list does not exist?

This is my situation:

[root@addc1 ~]# samba-tool computer list
WIN10B$
ADDC1$
centos8$
WIN10A$

[root@addc1 ~]# samba-tool dns query \
> addc1.fedora.loc fedora.loc @ ALL -Uadministrator
 Name=, Records=3, Children=0
    SOA: serial=7, refresh=900, retry=600, expire=86400, minttl=3600,
ns=addc1.fedora.loc., email=hostmaster.fedora.loc. (flags=600000f0,
serial=7, ttl=3600)
    NS: addc1.fedora.loc. (flags=600000f0, serial=4, ttl=900)
    A: 192.168.122.100 (flags=600000f0, serial=4, ttl=900)
  Name=_msdcs, Records=0, Children=0
  Name=_sites, Records=0, Children=1
  Name=_tcp, Records=0, Children=4
  Name=_udp, Records=0, Children=2
  Name=addc1, Records=1, Children=0
    A: 192.168.122.100 (flags=f0, serial=1, ttl=900)
  Name=centos8, Records=1, Children=0
    A: 192.168.122.11 (flags=f0, serial=2, ttl=900)
  Name=DomainDnsZones, Records=0, Children=2
  Name=ForestDnsZones, Records=0, Children=2
  Name=test, Records=1, Children=0
    A: 192.168.122.33 (flags=f0, serial=5, ttl=3600)

Like you say, win10a and win10b are not present into DNS zone

This is my smb.conf:
[root@addc1 ~]# cat /etc/samba/smb.conf
# Global parameters
[global]
        netbios name = ADDC1
        realm = FEDORA.LOC
        server role = active directory domain controller
        server services = s3fs, rpc, nbt, wrepl, ldap, cldap, kdc,
drepl, winbindd, ntp_signd, kcc, dnsupdate
        workgroup = FEDORA
        idmap_ldb:use rfc2307 = yes
#
        template shell = /bin/bash
        template homedir = /home/%U

[sysvol]
        path = /var/lib/samba/sysvol
        read only = No

[netlogon]
        path = /var/lib/samba/sysvol/fedora.loc/scripts
        read only = No

This is my named.conf:
[root@addc1 ~]# cat /etc/named.conf
acl acl-local-lan {
        127.0.0.1;
        192.168.0.0/16;
        172.16.0.0/12;
        10.0.0.0/8;
};

options {
        //listen-on port 53 { 0.0.0.0; };
        listen-on port 53 { 127.0.0.1; 192.168.122.100; };
        //listen-on-v6 port 53 { ::1; };
        directory       "/var/named";
        dump-file       "/var/named/data/cache_dump.db";
        statistics-file "/var/named/data/named_stats.txt";
        memstatistics-file "/var/named/data/named_mem_stats.txt";
        secroots-file   "/var/named/data/named.secroots";
        recursing-file  "/var/named/data/named.recursing";

        //allow-query     { localhost; };
        allow-query     { acl-local-lan; };
        allow-transfer  { acl-local-lan; };
        allow-recursion { acl-local-lan; };
        recursion yes;

        dnssec-enable no;
        dnssec-validation no;

        managed-keys-directory "/var/named/dynamic";

        pid-file "/run/named/named.pid";
        //session-keyfile "/run/named/session.key";

        /* https://fedoraproject.org/wiki/Changes/CryptoPolicy */
        include "/etc/crypto-policies/back-ends/bind.config";

        send-cookie no;

        tkey-gssapi-keytab "/var/lib/samba/bind-dns/dns.keytab";
};

logging {
        channel default_debug {
                null;
        };
};

zone "." IN {
        type hint;
        file "named.ca";
};

include "/etc/named.rfc1912.zones";
include "/etc/named.root.key";

include "/var/lib/samba/bind-dns/named.conf";


What am I doing wrong

Many thanks for you patient. 

-- 
Dario Lesca
(inviato dal mio Linux Fedora 31 Workstation)


